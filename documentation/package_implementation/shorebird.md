# shorebird_code_push: ^1.1.3
A Dart package for communicating with the Shorebird Code Push Updater. Use this in your Shorebird app to:
✅ Get the currently installed patch version
✅ Check whether a new patch is available
✅ Download new patches
 
1. Add to Pubspec.yaml
   shorebird_code_push: ^1.1.3

2. Install ShoreBird cli in mac use below command to install
   ```
   curl --proto '=https' --tlsv1.2 https://raw.githubusercontent.com/shorebirdtech/install/main/install.sh -sSf | bash -s -- --force
   ```

3. Check verion by running the following command
   ```shorebird --version```
   [Expected Output]
   Shorebird 1.1.8 • git@github.com:shorebirdtech/shorebird.git
   Flutter 3.22.1 • revision 985ec84cb99d3c60341e2c78be9826e0a88cc697
   Engine • revision 0f962124273f5bdbd5732c7fd8e7dc8addd9ee7d

4. Then need to login in shorebird cli by following command
   ```shorebird login```
   (this will give you google and microsoft login option and after login you will see this)
   > [!OUTPUT]
   >🔑 Credentials are stored in /Users/amit.p/Library/Application Support/shorebird/credentials.json.
   >🚪 To logout use: "shorebird logout".
    
5. Initialize Shorebird in your Flutter project 🐦
   ```shorebird init```
   ✓ No product flavors detected. (17.0s)
   ? How should we refer to this app? (base_project_flutter) [TYPE YOUR PROJECT NAME]

   🐦 Shorebird initialized successfully!
   ✅ A shorebird app has been created.
   ✅ A "shorebird.yaml" has been created.
   ✅ The "pubspec.yaml" has been updated to include "shorebird.yaml" as an asset.
   Reference the following commands to get started:
   📦 To create a new release use: "shorebird release".
   🚀 To push an update use: "shorebird patch".
   👀 To preview a release use: "shorebird preview".



