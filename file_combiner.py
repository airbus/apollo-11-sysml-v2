import os

def combine_sysml_files(root_directory, output_filename):
    """
    Recursively finds all files with the .sysml extension in a directory
    and combines their contents into a single output file, ensuring each
    file is only included once.

    Args:
        root_directory (str): The path to the directory to start searching from.
        output_filename (str): The name of the file to write the combined content to.
    """
    if not os.path.isdir(root_directory):
        print(f"Error: The specified directory '{root_directory}' does not exist.")
        return

    processed_files = set()  # Use a set to store the paths of processed files

    try:
        # Open the output file in write mode. This will create the file if it
        # doesn't exist, or overwrite it if it does.
        with open(output_filename, 'w', encoding='utf-8') as outfile:
            print(f"Searching for .sysml files in '{root_directory}'...")
            
            # os.walk() generates the file names in a directory tree by walking the
            # tree either top-down or bottom-up.
            for dirpath, _, filenames in os.walk(root_directory):
                for filename in filenames:
                    if filename.endswith('.sysml'):
                        if filename != output_filename:
                            file_path = os.path.join(dirpath, filename)
                            # Get the absolute path to uniquely identify the file
                            absolute_path = os.path.abspath(file_path)

                            if absolute_path not in processed_files:
                                try:
                                    # Open each .sysml file and read its content.
                                    with open(file_path, 'r', encoding='utf-8', errors='ignore') as infile:
                                        print(f"  -> Found and processing: {file_path}")
                                        # Write the content of the .sysml file to the output file.
                                        outfile.write(f"//--- Content from: {file_path} ---\n\n")
                                        outfile.write(infile.read())
                                        outfile.write("\n\n")
                                        # Add the file path to our set of processed files
                                        processed_files.add(absolute_path)
                                except IOError as e:
                                    print(f"      Error reading file {file_path}: {e}")
                            else:
                                print(f"  -> Skipping duplicate file: {file_path}")
                        else:
                            print(f"  -> Skipping output file: {file_path}")


            print(f"\nAll unique .sysml files have been combined into '{output_filename}'.")

    except IOError as e:
        print(f"Error: Could not write to output file '{output_filename}': {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == '__main__':
    start_directory = '.' 
    combined_file_name = './output/single_file_apollo11_model.sysml'
    
    combine_sysml_files(start_directory, combined_file_name)