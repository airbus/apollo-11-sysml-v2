# Dependency Tree for {{START_FILE}}

## Legend

- **{{PROJECT_NAME}}** (subgraph, blue gradient) - Core domain packages with depth-based coloring (dark blue = root, light blue = deeper){{UTILITIES_LEGEND}}
- **{{FOUNDATION_NAME}}** (subgraph, light cyan) - SysML V2 standard libraries
- Solid arrows → - Core domain dependencies between Apollo 11 packages
- Dashed arrows -.-> - Dependencies on foundation and library packages

---

## Dependency Graph (Mermaid)

{{MERMAID_DIAGRAM}}

---

## Package Reference Count

This section shows how often each package is referenced in the dependency tree,
sorted from least to most frequently referenced.

{{PACKAGE_REFERENCES}}

## Circular Dependcies

{{CYCLES_SECTION}}