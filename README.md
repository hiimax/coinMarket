# 🚀 Flutter App Setup Guide

This guide explains how to get the project up and running, including localization, asset generation, code generation, and how to run the app in different environments.

---

## 📦 Prerequisites

Make sure you have the following installed:

* Flutter SDK (latest stable)
* Dart SDK
* VS Code or Android Studio
* Firebase CLI (if using Firebase)
* Git

---

## ⚙️ Setup Instructions

### 🗁️ 1. Generate Localization Files

Run the following command to generate localization (l10n) files:

```bash
flutter gen-l10n
```

> This uses your `l10n.yaml` config and `.arb` files to generate translated resources.

---

### 🖼️ 2. Generate Assets with Spider

Install the [Spider](https://pub.dev/packages/spider) package globally if you haven't:

```bash
dart pub global activate spider
```

Then run:

```bash
spider build --watch
```

> `--watch` automatically rebuilds assets when changes are detected.

---

### 🛠️ 3. Generate Code with Build Runner

Run the following command to generate necessary code (e.g., for models, freezed, etc.):

```bash
flutter pub run build_runner build
```

> If you encounter conflicts, run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

### 📱 4. Run the App (Development Mode)

You can run the development flavor using this command:

```bash
flutter run --target lib/app/main.dev.dart
```

---

## 🧪 VS Code Launch Configuration

To simplify running and debugging from VS Code, use the following `launch.json`:

```jsonc
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "prodev",
      "request": "launch",
      "type": "dart",
      "program": "lib/app/main.dev.dart",
      "args": [
        "-v",
        "development",
        "--target",
        "lib/app/main.dev.dart"
      ]
    },
    {
      "name": "prodev (profile mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "profile"
    },
    {
      "name": "prodev (release mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "release"
    }
  ]
}
```

> Place this inside `.vscode/launch.json`.

---

## 🧹 Tips

* Always run `flutter clean` if you experience strange issues.
* Ensure you’re connected to a device or emulator before running.
* Keep your `pubspec.yaml` dependencies up to date.

---

## 📟 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙌 Contribution

Feel free to submit issues or pull requests if you find bugs or want to improve something.
# prodev_



Technical information

State Management 
-Riverpod and Hooks

Asset generator
-spider

Public Api
-Spotify Api