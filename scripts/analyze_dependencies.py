"""
Analyzes SysML V2 dependencies for the Apollo 11 model.

This script parses SysML V2 files to extract and analyze import dependencies,
detecting cycles and generating Mermaid diagrams for visualization.

Platform Support:
    This script runs on Windows, Linux, and macOS using Python 3.8 or later.

Author:
    Daniel Siegl

Copyright:
    (c) 2024-2026 Daniel Siegl. All rights reserved.
    Licensed under the terms specified in LICENSE.md
"""

import os
import re
import argparse
import sys
from typing import List, Dict, Tuple


class DependencyAnalyzer:
    """Analyzes SysML V2 file dependencies and generates dependency graphs."""
    
    PROJECT_NAME = "Apollo 11 Model"
    UTILITIES_NAME = "Platform Services & Utilities"
    FOUNDATION_NAME = "Foundation / Libraries"
    
    SYSML_V2_STANDARDS = [
        "NumericalFunctions", "ScalarFunctions", "CollectionFunctions", "ControlFunctions",
        "Metaobjects", "States", "Parts", "OccurrenceFunctions",
        "ISQ", "SI", "USCustomaryUnits", "MeasurementReferences", "Quantities",
        "ScalarValues", "Time", "ModelingMetadata", "ShapeItems"
    ]
    
    def __init__(self, start_file: str = "Apollo11Model.sysml", repo_path: str = "."):
        self.start_file = start_file
        self.repo_path = repo_path
        self.output = []
        self.mermaid_edges = []
        self.node_depths = {}
        self.visited = {}
        self.import_chain = []
        self.cycles = []
    
    def get_imports(self, file_path: str) -> List[str]:
        """Extract unique imports from a SysML V2 file."""
        if not os.path.isfile(file_path):
            return []
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                matches = re.findall(r'import\s+([\w:]+)::\*', f.read())
            return list(set(matches))
        except IOError as e:
            print(f"  Error reading file {file_path}: {e}")
            return []
    
    def find_package_file(self, package_name: str) -> str:
        """Find the file path for a given package name."""
        for file_name in [f"{package_name}.sysml", f"{package_name.replace('Package', '')}.sysml"]:
            for root, _, files in os.walk(self.repo_path):
                if file_name in files:
                    return os.path.join(root, file_name)
        return None
    
    def _clean_name(self, file_name: str) -> str:
        """Remove .sysml extension from file name."""
        return file_name.replace('.sysml', '')
    
    def build_dependency_tree(self, file_path: str, depth: int = 0, prefix: str = "") -> None:
        """Recursively build the dependency tree from a starting file."""
        file_name = os.path.basename(file_path)
        
        # Check for cycles in current path
        if file_path in self.import_chain:
            chain = self.import_chain[self.import_chain.index(file_path):] + [file_path]
            cycle_str = " → ".join([os.path.basename(f) for f in chain])
            if cycle_str not in self.cycles:
                self.cycles.append(cycle_str)
            self.output.append(f"{prefix}- {file_name} (true cycle) :red_circle:")
            print(f"{prefix}- {file_name} (true cycle) [RED]")
            return
        
        # Check if already visited
        if file_path in self.visited:
            self.output.append(f"{prefix}- {file_name} (re-visited) :orange_circle:")
            print(f"{prefix}- {file_name} (re-visited) [YELLOW]")
            return
        
        self.visited[file_path] = True
        self.import_chain.append(file_path)
        
        self.output.append(f"{prefix}- {file_name}")
        print(f"{prefix}- {file_name} [GREEN]")
        
        # Track node depth
        clean_name = self._clean_name(file_name)
        self.node_depths.setdefault(clean_name, depth)
        
        # Process imports
        for import_name in self.get_imports(file_path):
            package_file = self.find_package_file(import_name)
            
            if package_file:
                # Project package dependency
                clean_import = self._clean_name(os.path.basename(package_file))
                self.mermaid_edges.append(f"{clean_name} --> {clean_import};")
                self.node_depths.setdefault(clean_import, depth + 1)
                self.build_dependency_tree(package_file, depth + 1, prefix + "  ")
            elif import_name in self.SYSML_V2_STANDARDS:
                # SysML V2 standard dependency
                self.output.append(f"{prefix}  - {import_name} (SysML V2 Standard) :green_circle:")
                print(f"{prefix}  - {import_name} (SysML V2 Standard) [GREEN]")
                self.mermaid_edges.append(f"{clean_name} -.-> {import_name};")
                self.node_depths.setdefault(import_name, depth + 1)
            else:
                # Not found
                self.output.append(f"{prefix}  - {import_name} (not found) :red_circle:")
                print(f"{prefix}  - {import_name} (not found) [RED]")
        
        # Remove from import chain when backtracking
        if self.import_chain and self.import_chain[-1] == file_path:
            self.import_chain.pop()
    
    def count_package_references(self) -> Dict[str, int]:
        """Count how many times each package is referenced, excluding root file."""
        counts = {}
        start_name = self._clean_name(self.start_file)
        
        for line in self.output:
            package = re.sub(r'\s+:[a-z_]+:', '', line.strip('- ')).strip()
            # Skip if empty, is the root file, or is the cleaned root file name
            if package and package != self.start_file and self._clean_name(package) != start_name:
                counts[package] = counts.get(package, 0) + 1
        
        return counts
    
    def generate_reference_report(self) -> List[str]:
        """Generate a reference count report sorted by frequency."""
        counts = self.count_package_references()
        sorted_packages = sorted(counts.items(), key=lambda x: (x[1], x[0]))
        
        report = []
        for package_name, count in sorted_packages:
            status = '🟢' if package_name.replace(' (SysML V2 Standard)', '') in self.SYSML_V2_STANDARDS else ''
            report.append(f"- **{package_name}** {status}: `{count}` reference(s)")
        
        report.append("")
        return report
    
    def categorize_packages(self) -> Tuple[List[str], List[str]]:
        """Categorize packages into core model and utility packages."""
        all_project = [n for n in self.node_depths if n not in self.SYSML_V2_STANDARDS]
        core, utility = [], []
        edge_pattern = re.compile(r'\s+-->\s+|\s+-\.->\s+')
        
        for pkg in all_project:
            has_core_dep = any(
                (dest := edge_pattern.split(e)[1].rstrip(';')) not in self.SYSML_V2_STANDARDS
                and dest in all_project
                for e in self.mermaid_edges if e.startswith(f"{pkg} ")
            )
            (core if has_core_dep else utility).append(pkg)
        
        return sorted(core), sorted(utility)
    
    def generate_mermaid_content(self, core_pkgs: List[str], util_pkgs: List[str]) -> List[str]:
        """Generate Mermaid diagram content."""
        content = ["```mermaid", "flowchart LR", "  %% Clusters"]
        
        # Subgraphs
        content.append(f'  subgraph Model["{self.PROJECT_NAME}"]')
        content.extend(f"    {pkg}" for pkg in core_pkgs)
        content.append("  end")
        
        if util_pkgs:
            content.append(f'  subgraph Utilities["{self.UTILITIES_NAME}"]')
            content.extend(f"    {pkg}" for pkg in util_pkgs)
            content.append("  end")
        
        content.append(f'  subgraph Foundation["{self.FOUNDATION_NAME}"]')
        content.extend(f"    {pkg}" for pkg in self.SYSML_V2_STANDARDS)
        content.append("  end")
        
        # Edges
        content.append("")
        core_edges = [e for e in self.mermaid_edges if e.split()[1].strip(';') not in self.SYSML_V2_STANDARDS]
        content.extend(f"  {e}" for e in core_edges)
        
        content.append("")
        for e in self.mermaid_edges:
            if e not in core_edges:
                content.append(f"  {e}")
        
        # Styling
        content.extend(["", "  %% Styling"])
        content.append("  classDef foundation fill:#e8f4f8,stroke:#0288d1,stroke-width:2px,color:#01579b")
        content.append(f"  class {','.join(self.SYSML_V2_STANDARDS)} foundation")
        
        if util_pkgs:
            content.append("  classDef utility fill:#d4d4d4,stroke:#666,stroke-width:2px,color:#333")
            content.append(f"  class {','.join(util_pkgs)} utility")
        
        depth_colors = {i: c for i, c in enumerate([
            "#0a0e27", "#0d47a1", "#1565c0", "#1976d2", "#2196f3", "#42a5f5", "#64b5f6"
        ])}
        
        nodes_by_depth = {}
        for node in core_pkgs:
            d = min(self.node_depths.get(node, 0), 6)
            nodes_by_depth.setdefault(d, []).append(node)
        
        for d in range(7):
            if d in nodes_by_depth:
                content.append(f"  classDef depth{d} fill:{depth_colors[d]},stroke:#000,stroke-width:1px,color:#fff")
        
        for d in range(7):
            if d in nodes_by_depth:
                content.append(f"  class {','.join(set(nodes_by_depth[d]))} depth{d}")
        
        content.append("```")
        return content
    
    def analyze(self) -> None:
        """Run the complete dependency analysis."""
        start_path = os.path.join(self.repo_path, self.start_file)
        if not os.path.isfile(start_path):
            print(f"Error: {self.start_file} not found in {self.repo_path}", file=sys.stderr)
            sys.exit(1)
        
        print(f"# Dependency Tree for {self.start_file}\n")
        self.build_dependency_tree(start_path)
        print()
        
        core_pkgs, util_pkgs = self.categorize_packages()
        
        # Load template
        template_path = os.path.join(os.path.dirname(__file__), "dependencies_template.md")
        try:
            with open(template_path, 'r', encoding='utf-8') as f:
                template = f.read()
        except IOError as e:
            print(f"Error: Could not read template file: {e}", file=sys.stderr)
            sys.exit(1)
        
        # Prepare replacements
        utilities_legend = f"\n- **{self.UTILITIES_NAME}** (subgraph, gray) - Packages that ONLY depend on SysML V2 standards" if util_pkgs else ""
        
        if self.cycles:
            cycles_section = "\n## Circular Dependencies Found\n\nThe following circular dependency cycles were detected:\n\n"
            cycles_section += "\n".join(f"- `{cycle}`  " for cycle in self.cycles)
        else:
            cycles_section = "\n✅ **No circular dependencies found** - The dependency structure is acyclic."
        
        # Generate content sections
        mermaid_content = '\n'.join(self.generate_mermaid_content(core_pkgs, util_pkgs))
        package_refs = '\n'.join(self.generate_reference_report())
        dep_tree = '\n'.join(self.output)
        
        # Replace placeholders
        content = template
        content = content.replace("{{START_FILE}}", self.start_file)
        content = content.replace("{{PROJECT_NAME}}", self.PROJECT_NAME)
        content = content.replace("{{FOUNDATION_NAME}}", self.FOUNDATION_NAME)
        content = content.replace("{{UTILITIES_LEGEND}}", utilities_legend)
        content = content.replace("{{MERMAID_DIAGRAM}}", mermaid_content)
        content = content.replace("{{PACKAGE_REFERENCES}}", package_refs)
        content = content.replace("{{CYCLES_SECTION}}", cycles_section)
        
        # Write to file
        output_file = os.path.join(self.repo_path, "dependencies.md")
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"[OK] Dependency tree saved to: {output_file}\n")
            if self.cycles:
                print(f"Found {len(self.cycles)} true circular dependency cycle(s):")
                for cycle in self.cycles:
                    print(f"  - {cycle}")
        except IOError as e:
            print(f"Error: Could not write to output file: {e}", file=sys.stderr)
            sys.exit(1)


def main():
    """Main entry point for the dependency analyzer."""
    parser = argparse.ArgumentParser(
        description="Analyzes SysML V2 dependencies for the Apollo 11 model.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="Examples:\n  python analyze_dependencies.py\n  python analyze_dependencies.py --start-file Apollo11Model.sysml --repo-path ."
    )
    
    parser.add_argument('--start-file', default='Apollo11Model.sysml', help='Root SysML file to analyze (default: Apollo11Model.sysml)')
    parser.add_argument('--repo-path', default='.', help='Repository path containing SysML files (default: current directory)')
    
    args = parser.parse_args()
    DependencyAnalyzer(args.start_file, args.repo_path).analyze()


if __name__ == '__main__':
    main()
