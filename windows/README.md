1. Project Overview

Sandwich Shop App

This Flutter app makes it easy to build and manage custom sandwich orders. Users can pick sizes (Footlong or 6-inch), select their preferred bread, and add a note for each sandwich—perfect for recording those extra touches. The interface keeps everything organized: it tracks how many sandwiches you’ve added, breaks down totals by size, and lets you view or remove items as needed.

Highlights:

Choose size with a segmented control.

Select bread type from a drop-down menu.

Attach a special note to each sandwich before adding it.

“Add” and “Remove” buttons with limits prevent errors.

Each sandwich is stored in-memory with its own settings and notes.

Widget tests check core functionality and add/remove logic.

2. Setup Instructions

What you’ll need:

Any recent version of Windows (detailed steps below), macOS, or Linux.

Flutter SDK (ensure the flutter command is recognized in your terminal). Installation help: flutter.dev.

Git installed.

A device/emulator/desktop ready to run Flutter apps.

Quick Start

Clone this repository:

bash
git clone <your-repo-url>
cd "c:\Users\thayw\OneDrive\Desktop\University\lv5\programming application and programming languages\sandwich_shop"
Get the app’s dependencies:

bash
flutter pub get
Launch the app:

bash
flutter run
To target Windows specifically:

bash
flutter run -d windows
Alternatively, use VS Code or Android Studio: open this project, choose your device, and run/debug as normal.

Note:
If you modify how widgets are built or initial app state, remember to fully restart the app so Flutter picks up all your latest changes properly (especially for button controls and stateful widgets).

3. How to Use the App

Select your sandwich’s size with the SegmentedButton.

Pick a bread type from the drop-down.

Add any special requests in the instructions field.

Hit “Add” to store the whole combo (size, bread, note) in the order. If you hit the maximum, the button disables automatically.

Use “Remove” to delete your most recent sandwich (and note). This only works if there are items in your order.

User Tips:

Always type your note before pressing Add to ensure it goes with the right sandwich.

Removing an item deletes the latest sandwich and its note (like undoing your last action).

The app breaks down counts by Footlong and 6-inch.

Customizing:

You can change the item limit by passing a parameter to OrderScreen, e.g.:

dart
OrderScreen(maxQuantity: 5)
If you want persistent orders or change how orders are stored, extend the logic in lib/repositories/order_repository.dart.

Running Tests:

bash
flutter test
Example tests live in test/widget_test.dart. This includes verifying that the counter never exceeds the set quantity.

Adding Visuals:

Store screenshots/GIFs in assets/screenshots/ and refer to them in your documentation, e.g.:

assets/screenshots/home.png

assets/screenshots/add-note.gif

4. File Structure and Tools

App Folders and Files:

lib/

main.dart: main entry, UI and logic.

views/app_styles.dart: styles and theming helpers.

repositories/order_repository.dart: base logic for orders, set up for easy extension.

test/

widget_test.dart: core widget tests.

pubspec.yaml: dependency config.

Dependencies:

The app uses flutter plus any other packages you add (e.g., provider, shared_preferences).

Dev tools:

VS Code or Android Studio (both work).

Flutter DevTools for debugging and UI inspection.

5. Known Issues & Plans

Heads-up:

Make sure SegmentedButton can’t be left unselected. Use emptySelectionAllowed: false and initialize _selectedSize inside your widget to prevent bugs.

DropdownMenuEntry.label should be a Widget (wrap your string inside Text(...)), otherwise, it’ll throw a runtime error.

Dart doesn’t support repeating strings like '🥪' * n—instead, use:

dart
List.filled(n, '🥪').join()
All order data lives in memory; closing the app clears orders.

What’s next:

Add storage for orders (shared_preferences or sqflite).

Add order confirmations and summary screens.

Let users edit sandwiches (change note, bread, or size).

Continue to polish the UI and improve accessibility.

Contributing:

Open an issue before starting any large code changes.

Fork the repo, work on a separate branch, and add unit tests.

Keep pull requests focused; highlight any breaking changes directly in the PR.

6. Contact

Owner: Daniel Gardner

Email: Daniel.t.gardner@hotmail.com