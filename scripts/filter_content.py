#!/usr/bin/env python3
import os
import json
import sys
import glob

def get_project_models():
    # Find all *.model.lkml files in the project
    model_files = glob.glob("**/*.model.lkml", recursive=True)
    models = [os.path.basename(f).replace(".model.lkml", "") for f in model_files]
    print(f"Project models found: {models}")
    return set(models)

def find_model_references(data):
    models = set()
    if isinstance(data, dict):
        for k, v in data.items():
            if k == "model":
                if isinstance(v, str):
                    models.add(v)
                elif isinstance(v, dict):
                    if "id" in v:
                        models.add(v["id"])
                    if "name" in v:
                        models.add(v["name"])
            else:
                models.update(find_model_references(v))
    elif isinstance(data, list):
        for item in data:
            models.update(find_model_references(item))
    return models

def filter_content(target_dir, project_models):
    purged_files = 0
    total_files = 0

    for root, dirs, files in os.walk(target_dir, topdown=False):
        for file in files:
            if not file.endswith(".json"):
                continue
            
            total_files += 1
            file_path = os.path.join(root, file)
            
            try:
                with open(file_path, "r", encoding="utf-8") as f:
                    data = json.load(f)
            except Exception as e:
                print(f"Skipping unreadable JSON file {file_path}: {e}")
                continue

            # Find all model references in this look/dashboard JSON
            referenced_models = find_model_references(data)
            
            # If it references a model not in our project, purge it
            unrelated = referenced_models - project_models
            
            # Also if it references no models, check if it's a look/dashboard structure.
            # UDDs and looks must reference at least one model.
            if not referenced_models or unrelated:
                print(f"Purging {file_path} (References unrelated models: {list(referenced_models)})")
                os.remove(file_path)
                purged_files += 1

        # Clean up empty directories
        for d in dirs:
            dir_path = os.path.join(root, d)
            if os.path.exists(dir_path) and not os.listdir(dir_path):
                print(f"Removing empty directory: {dir_path}")
                os.rmdir(dir_path)

    print(f"Content filtering complete. Purged {purged_files} out of {total_files} files.")

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 filter_content.py <target_directory>")
        sys.exit(1)

    target_dir = sys.argv[1]
    if not os.path.isdir(target_dir):
        print(f"Error: {target_dir} is not a valid directory")
        sys.exit(1)

    project_models = get_project_models()
    if not project_models:
        print("Error: No LookML models found in the project. Cannot filter content.")
        sys.exit(1)

    filter_content(target_dir, project_models)

if __name__ == "__main__":
    main()
