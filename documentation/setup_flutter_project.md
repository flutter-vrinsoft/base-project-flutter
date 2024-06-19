Here's the updated Markdown file with the corrected script and comments:

```markdown
# Flutter Project Setup Automation Script

Automate the setup of a Flutter project with custom templates, including updating import statements and configurations.

---

## 📋 Prerequisites

- Ensure Flutter is installed and properly configured on your machine.
- Prepare your custom template directory with `lib`, `assets`, and `pubspec.yaml` files.

## 📁 Directory Structure

Make sure your template directory structure looks like this:

```
flutter_template/
├── lib/
├── assets/
└── pubspec.yaml
```

---

## 🚀 Scripts

### macOS Script

Save the following script as `setup_flutter_project.sh`:

```bash
#!/bin/bash

# Function to create a new Flutter project and set up custom structure
setup_flutter_project() {
  # Prompt for project name
  read -p "🗂️ Enter the project name: " project_name

  # Prompt for template directory
  read -p "🛣️ Enter the path to the template directory: " template_dir

  # Prompt for bundle name
  read -p "📦 Enter the bundle name (e.g., com.example.project): " bundle_name

  # Prompt for platforms (default to android and ios)
  read -p "📱 Enter the platforms (default: android,ios): " platforms
  if [ -z "$platforms" ]; then
    platforms="android,ios"
  fi

  # Step 1: Create a new Flutter project with specified platforms
  echo "🚀 Creating Flutter project..."
  flutter create --platforms=$platforms --org $bundle_name $project_name

  # Convert Windows path to Unix path format for Git Bash
  template_dir=$(echo $template_dir | sed 's/\\/\//g')

  # Step 2: Copy custom lib folder
  echo "🗂 Setting up custom structure..."
  rm -rf $project_name/lib
  cp -r "$template_dir/lib" "$project_name/"

  # Step 3: Copy assets folder
  cp -r "$template_dir/assets" "$project_name/"

  # Step 4: Replace pubspec.yaml file and update project name
  cp "$template_dir/pubspec.yaml" "$project_name/"
  sed -i "" "s/^name: .*/name: $project_name/" "$project_name/pubspec.yaml"
  sed -i "" "s/^  com.example.*/  $bundle_name/" "$project_name/pubspec.yaml"

  # Step 5: Update import statements in all Dart files
  find $project_name/lib -type f -name '*.dart' -exec sed -i "" "s/import 'package:base_project_flutter\//import 'package:$project_name\//g" {} +

  # Step 6: Update export statements in export.dart files
  find $project_name/lib -type f -name 'export.dart' -exec sed -i "" "s/export 'package:base_project_flutter\//export 'package:$project_name\//g" {} +

  echo "🎉 Flutter project $project_name set up successfully!"

  # Step 7: Run flutter pub get
  echo "📦 Running flutter pub get..."
  cd $project_name
  flutter pub get

  # Step 8: Open Android Studio and run flutter run
  echo "🚀 Opening Android Studio and running the project..."
  open -a "Android Studio" .
  flutter run
}

# Check if Flutter is installed
if ! command -v flutter &> /dev/null
then
  echo "❌ Flutter could not be found. Please install Flutter and try again."
  exit
fi

# Run the setup function
setup_flutter_project
```

### Windows Script (Git Bash)

Save the following script as `setup_flutter_project.sh`:

```bash
#!/bin/bash

# Function to create a new Flutter project and set up custom structure
setup_flutter_project() {
  # Prompt for project name
  read -p "🗂️ Enter the project name: " project_name

  # Prompt for template directory
  read -p "🛣️ Enter the path to the template directory: " template_dir

  # Prompt for bundle name
  read -p "📦 Enter the bundle name (e.g., com.example.project): " bundle_name

  # Prompt for platforms (default to android and ios)
  read -p "📱 Enter the platforms (default: android,ios): " platforms
  if [ -z "$platforms" ]; then
    platforms="android,ios"
  fi

  # Step 1: Create a new Flutter project with specified platforms
  echo "🚀 Creating Flutter project..."
  flutter create --platforms=$platforms --org $bundle_name $project_name

  # Convert Windows path to Unix path format for Git Bash
  template_dir=$(echo $template_dir | sed 's/\\/\//g')

  # Step 2: Copy custom lib folder
  echo "🗂 Setting up custom structure..."
  rm -rf $project_name/lib
  cp -r "$template_dir/lib" "$project_name/"

  # Step 3: Copy assets folder
  cp -r "$template_dir/assets" "$project_name/"

  # Step 4: Replace pubspec.yaml file and update project name
  cp "$template_dir/pubspec.yaml" "$project_name/"
  sed -i "s/^name: .*/name: $project_name/" "$project_name/pubspec.yaml"
  sed -i "s/^  com.example.*/  $bundle_name/" "$project_name/pubspec.yaml"

  # Step 5: Update import statements in all Dart files
  find $project_name/lib -type f -name '*.dart' -exec sed -i "s/import 'package:base_project_flutter\//import 'package:$project_name\//g" {} +

  # Step 6: Update export statements in export.dart files
  find $project_name/lib -type f -name 'export.dart' -exec sed -i "s/export 'package:base_project_flutter\//export 'package:$project_name\//g" {} +

  echo "🎉 Flutter project $project_name set up successfully!"

  # Step 7: Run flutter pub get
  echo "📦 Running flutter pub get..."
  cd $project_name
  flutter pub get

  # Step 8: Open Android Studio and run flutter run
  echo "🚀 Opening Android Studio and running the project..."
  start "Android Studio" .
  flutter run
}

# Check if Flutter is installed
if ! command -v flutter &> /dev/null
then
  echo "❌ Flutter could not be found. Please install Flutter and try again."
  exit
fi

# Run the setup function
setup_flutter_project
```

---

## 🛠 Usage

### Steps

1. **Prepare Your Custom Template:**
   - Ensure your template directory (`flutter_template/`) contains the necessary `lib/`, `assets/`, and `pubspec.yaml` files.

2. **Save the Script:**
   - Save the appropriate script (`setup_flutter_project.sh`) based on your operating system.

3. **Make the Script Executable (macOS):**
   - Open Terminal and navigate to the directory where you saved `setup_flutter_project.sh`.
   - Run the following command to make the script executable:
     ```bash
     chmod +x setup_flutter_project.sh
     ```

4. **Run the Script:**
   - Execute the script to create a new Flutter project with your custom setup by running:
     ```bash
     ./setup_flutter_project.sh
     ```
   - Follow the prompts to enter the project name, template directory path, bundle name, and optionally platforms.

### Example

Assume your template directory is located at `/Users/AMIT/Documents/flutter_template`.

To create a new Flutter project named `demo1` with the bundle name `com.vrinsoft.demo1` for Android and iOS, you would run:

```bash
./setup_flutter_project.sh
```

Then enter the requested information in the prompts.

## 💡 Notes

- This script will replace all instances of `base_project_flutter` in import and export statements with the new project name and package name.
- Ensure the template directory paths are correct and accessible.
- Customize the script further to fit specific project requirements.

---

I hope this helps streamline your Flutter project setup process! If you have any questions or need further assistance, feel free to ask. Happy coding! 🚀