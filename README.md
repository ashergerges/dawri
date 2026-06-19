# dawri

# Introduction
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project.

# Build and Test

TODO: Describe and show how to build your code and run the tests.

### build_runner

- Used for generating assets
- Used for generating immutable classes, JSON serialization, Models and freeze Cubits


```bash
  dart run build_runner build --delete-conflicting-outputs
  ``` 

## export compliance questionnaire every time you upload a new version of your app (AppStoreConnect)

<key>ITSAppUsesNonExemptEncryption</key>
<false/>

### Easy Localization

- Library for handling app localization.
- Command for generating localization keys:

```bash
  dart run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart -O lib/gen
  ```



# For build dev APK

```bash
  flutter build apk --flavor dev -t lib/main.dart
   ```

# For build prod APK --release

```bash
  flutter build apk --flavor prod -t lib/main.dart --release
   ```

# Flutter Version
- 3.38
