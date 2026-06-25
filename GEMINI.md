# Gemini Agent Guidelines - Looker Project

## Looker Project Specification
- **Instance URL:** https://63d8480f-f779-43e6-b043-34fbb61a06e6.looker.app
- **Project ID:** looker_cicd_sample

## Core Development Principles
- **LookML Best Practices:** Always consult available Looker skills and documentation for instructions on creating and optimizing LookML.
- **Looker Validation:** You must run the `dev_mode` and then `validate_project` MCP tool every time a file is updated.
- **Code Integrity:** Never commit broken code. Ensure all validation checks pass before proceeding to the commit stage.

## Git & Deployment Workflow
- **Commits:** Create and push commits often. Aim to commit after the completion of every individual feature or logical change when the user confirms it's completed.
- **Commit Messages:** Must follow commit message guidelines at https://www.conventionalcommits.org/en/v1.0.0/#summary