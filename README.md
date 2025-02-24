
# Django Installation Script

This guide explains how to use the provided script to install Django and set up a new Django project on an ubuntu server. All the best.

## How to Use the Script

1. Save the script to a file, e.g., `install_django.sh`.
2. Make the script executable:
   ```bash
   chmod +x install_django.sh
   ```
3. Run the script:
   ```bash
   ./install_django.sh
   ```

## What the Script Does

1. **Updates and upgrades the system**: Ensures your system is up-to-date.
2. **Installs Python and pip**: Installs Python and the pip package manager if they are not already installed.
3. **Installs Django and its dependencies**: Installs Django and any required dependencies.
4. **Checks and lists versions**: Displays the installed versions of Python, pip, and Django.
5. **Prompts for a Django project name**: Asks the user to provide a name for the Django project.
6. **Creates a Django project**: Generates a new Django project using the provided name.
7. **Starts the Django development server**: Runs the Django development server on `0.0.0.0:8000`.
8. **Runs a quick test**: Uses `curl` to test the server by accessing `http://localhost:8000`.
9. **Echoes completion**: Displays a message indicating the process is done if successful.

## Notes

- The Django server runs in the background (`&`), so you can stop it manually if needed.
- The `sleep 7` command gives the server time to start before running the `curl` test.
- Ensure port `8000` is open and available on your server.

---
