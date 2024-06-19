Certainly! Here is the detailed markdown file with the new script, including explanations, emojis, and formatting for clarity.

---

# Flutter Project Setup Automation Script

Automating the setup of a Flutter project with custom templates can save a lot of time and ensure consistency. This guide provides a script for both macOS and Windows users to set up a Flutter project with a predefined structure from a GitHub repository, including updating import statements and other configurations.

## 📋 Prerequisites

- Ensure Flutter is installed and properly set up on your machine.
- Have your custom template ready on GitHub, including `lib` folder, `assets` folder, and `pubspec.yaml` file.

## 📁 Directory Structure

Make sure your template directory on GitHub looks like this:

```
flutter_template/
├── lib/
├── assets/
└── pubspec.yaml
```

## 🚀 Script

Save the following script as `setup_flutter_project_github.sh`:

```bash
#!/bin/bash

# Function to create a new Flutter project and set up custom structure
setup_flutter_project() {
  # Prompt for project name
  read -p "🗂️ Enter the project name: " project_name

  # Prompt for GitHub repository URL (default: https://github.com/flutter-vrinsoft/base-project-flutter)
  read -p "🌐 Enter the GitHub repository URL (default: https://github.com/flutter-vrinsoft/base-project-flutter): " github_url
  github_url=${github_url:-"https://github.com/flutter-vrinsoft/base-project-flutter"}

  # Prompt for branch or tag name (default: level-1)
  read -p "🔖 Enter the branch or tag name (default: level-1): " branch_or_tag
  branch_or_tag=${branch_or_tag:-"level-1"}

  # Prompt for bundle name
  read -p "📦 Enter the bundle name (e.g., com.example.project): " bundle_name

  # Prompt for platforms (default to android and ios)
  read -p "📱 Enter the platforms (default: android,ios): " platforms
  if [ -z "$platforms" ]; then
    platforms="android,ios"
  fi

  echo ""  # Add a blank line for spacing

  # Step 1: Create a new Flutter project with specified platforms
  echo "🚀 Creating Flutter project..."
  flutter create --platforms=$platforms --org $bundle_name $project_name

  # Step 2: Fetch template from GitHub repository
  echo "🔄 Fetching template from GitHub repository..."
  git clone --branch $branch_or_tag --depth 1 $github_url temp_repo
  cp -r temp_repo/lib $project_name/
  cp -r temp_repo/assets $project_name/
  cp temp_repo/pubspec.yaml $project_name/
  rm -rf temp_repo

  # Step 3: Replace pubspec.yaml file and update project name
  sed -i "" "s/^name: .*/name: $project_name/" "$project_name/pubspec.yaml"
  sed -i "" "s/^  com.example.*/  $bundle_name/" "$project_name/pubspec.yaml"

  # Step 4: Update import statements in all Dart files
  find $project_name/lib -type f -name '*.dart' -exec sed -i "" "s/import 'package:base_project_flutter\//import 'package:$project_name\//g" {} +

  # Step 5: Update export statements in export.dart files
  find $project_name/lib -type f -name 'export.dart' -exec sed -i "" "s/export 'package:base_project_flutter\//export 'package:$project_name\//g" {} +

  echo "🎉 Flutter project $project_name set up successfully!"

  # Step 6: Run flutter pub get
  echo "📦 Running flutter pub get..."
  cd $project_name
  flutter pub get

  # Step 7: Open Android Studio and run flutter run
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

## 🛠 Usage

### Steps

1. **Prepare Your Custom Files on GitHub:**
    - Ensure your template directory on GitHub has the correct structure:
      ```
      https://github.com/flutter-vrinsoft/base-project-flutter
      ├── lib/
      ├── assets/
      └── pubspec.yaml
      ```
    - The default branch or tag is `level-1`.

2. **Save the Script:**
    - Save the above script as `setup_flutter_project_github.sh`.

3. **Make the Script Executable (macOS):**
    - Open Terminal and navigate to the directory where you saved `setup_flutter_project_github.sh`.
    - Run the following command to make the script executable:
      ```bash
      chmod +x setup_flutter_project_github.sh
      ```

4. **Run the Script:**
    - Use the script to create a new Flutter project with your custom setup by running:
      ```bash
      ./setup_flutter_project_github.sh
      ```
    - Follow the prompts to enter the project name, GitHub URL, branch or tag, bundle name, and platforms. If you leave the GitHub URL or branch empty, the defaults will be used.

### Example

Assume you want to create a new Flutter project named `demo1` with the bundle name `com.vrinsoft.demo1` for Android and iOS. You would run:

```bash
./setup_flutter_project_github.sh
```

Follow the prompts and enter the following when asked:

- **Project name:** `demo1`
- **GitHub repository URL:** *(press Enter to use default)*
- **Branch or tag name:** *(press Enter to use default)*
- **Bundle name:** `com.vrinsoft.demo1`
- **Platforms:** *(press Enter to use default)*

## 💡 Notes

- This script will replace all instances of `base_project_flutter` in import and export statements with the new project name.
- Ensure the template directory paths on GitHub are correct and accessible.
- You can customize the script further to fit your specific needs.

## 🖼 Example Output

![Flutter Project Setup](https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png)

---

I hope this helps streamline your Flutter project setup process! If you have any questions or need further assistance, feel free to ask. Happy coding! 🚀