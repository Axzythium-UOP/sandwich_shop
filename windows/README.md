Sandwich Shop App
Effortlessly build and manage custom sandwich orders with this Flutter-powered web app. Users can choose their sandwich size (Footlong or 6-inch), select a bread type, add personalized notes, and keep their orders organized. The interface tracks your order breakdown by size and lets you view and remove items as needed—all changes remain in-memory for quick iteration and testing.

Highlights
Size selector with an intuitive segmented control

Bread type selection via drop-down menu

Attach a custom note to each sandwich when ordering

"Add" and "Remove" buttons, with limits to prevent accidental errors

Orders and their notes are stored in-app and tracked live

Counts for 6-inch and Footlong sandwiches always visible

Widget tests ensure robust add/remove logic

1. Setup Instructions
Requirements:

Windows, macOS, or Linux

# Sandwich Shop

This is a simple Flutter app that allows users to order sandwiches. The app is built using Flutter and Dart and is designed to run on desktop, mobile, and web targets.

## Install the essential tools

1. Terminal / shell

	- macOS – use the built-in Terminal app (
	  press ⌘ + Space, type "Terminal", then Return).
	- Windows – open **Command Prompt**, **PowerShell** or **Windows Terminal** from the Start menu.

2. Git

	- Verify with: `git --version`
	- If missing, download from https://git-scm.com/downloads

3. Package managers (optional, helpful)

	- Homebrew (macOS): `brew --version` — install from https://brew.sh/
	- Chocolatey (Windows): `choco --version` — install from https://chocolatey.org/install

4. Flutter SDK

	- Verify with: `flutter doctor`
	- If missing:
	  - macOS: `brew install --cask flutter`
	  - Windows: `choco install flutter`

5. Editor (recommended)

	- Visual Studio Code: `code --version` (install via Homebrew/Chocolatey or from https://code.visualstudio.com/)

## Get the code

If this is your first time working on the project:

```bash
git clone https://github.com/Axzythium-UOP/flutter_application_1.git
cd sandwich_shop
code .
```

If you've already cloned the repository and need to switch branches:

```bash
git fetch origin
git checkout WS4
```

> Note: replace the remote/branch names above with those your team uses.

## Run the app

Install dependencies and run the app in a browser or desktop target:

```bash
flutter pub get
flutter run
```

To target Windows specifically (if you have desktop support enabled):

```bash
flutter run -d windows
```

In VS Code or Android Studio, open the project, pick a device (or Chrome/Edge for web) and press Run/Debug.

## Usage

- Select sandwich size using the Segmented control (Footlong or Six-inch).
- Pick bread type from the dropdown menu.
- Add an order note in the text field before pressing Add (the note will be attached to the next sandwich added).
- The Add button is disabled when the maximum quantity is reached. Remove is disabled at zero.
- Live counts show the number of sandwiches and breakdown by size.

## Customizing & testing

- Change maximum items by passing a parameter to the screen:

```dart
OrderScreen(maxQuantity: 5)
```

- Run tests with:

```bash
flutter test
```

Tests live in `test/widget_test.dart` and cover the main add/remove flows.

## Project structure (high level)

- `lib/main.dart` — app entry point and UI
- `lib/app_styles.dart` — shared styles
- `lib/repositories/` — (optional) data/repo layer
- `test/` — widget and unit tests
- `pubspec.yaml` — dependency list

## Troubleshooting

- If SegmentedButton can be unselected, set `emptySelectionAllowed: false` and initialize the selected value.
- If imports look wrong, ensure paths are relative to `lib/` or use package imports like `package:sandwich_shop/...`.
- If UI doesn't update after code changes, try a full restart of the app (stop and `flutter run` again).

## Support

Use your project's communication channels (issues, PRs, or the team Discord) and include error messages and screenshots when reporting problems.

---

If you want, I can also:

- Add a short section describing how the SegmentedButton and StyledButton are implemented in `lib/main.dart`.
- Add developer setup tips specific to macOS or Windows CI.

Contact: Dan Gardner
Email: Daniel.t.gardner@hotmail.com