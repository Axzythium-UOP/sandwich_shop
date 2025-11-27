Project overview
Users pick Footlong or 6-inch via a segmented control, choose bread from a dropdown, and optionally add per-item special instructions before adding an item.​

The UI tracks total quantity, counts per size, and stores each sandwich’s size and attached note in memory.​

Installation and setup
Prerequisites

Windows, macOS, or Linux with Flutter SDK (stable) installed and on PATH.​

Git installed, plus a connected device/emulator or enabled desktop support.

Steps

Install dependencies:

bash
flutter pub get
Run the app:

Generic:

bash
flutter run
Windows:

bash
flutter run -d windows
Or open the folder in VS Code / Android Studio, select a device, and run or debug.

Note: After changing widget constructors or state initialization, perform a full restart rather than only hot reload to avoid issues with SegmentedButton selection and controllers.

Using the app
Main flow

Select size with the SegmentedButton (Footlong / 6-inch).

Pick bread type from the dropdown (White, Wheat, Wholemeal).

Enter any special instructions (for example: “no onions”) in the text field.

Press Add to append a sandwich with the chosen size, bread, and note; Add disables when the order reaches maxQuantity.

Press Remove to remove the most recently added sandwich and its note; Remove disables when there are no items.

Behavior details

Notes are captured at the moment Add is pressed and stored per item.

Items are removed in LIFO order (last-added sandwich and note removed first).

Counts per size and total quantity are shown in the order display.

Configuration & tests

OrderScreen(maxQuantity: 5) lets you change the maximum allowed sandwiches.

OrderRepository (lib/repositories/order_repository.dart) is a stub for persistence or custom business rules.

Run tests with:

bash
flutter test
test/widget_test.dart demonstrates widget tests that validate Add/Remove behavior and maxQuantity constraints.​

Structure and technologies
lib/

main.dart: App entry point; defines OrderScreen, StyledButton, and OrderItemDisplay.

views/app_styles.dart: Shared styling and theme helpers.

repositories/order_repository.dart: Order logic and persistence extension point.

test/

widget_test.dart: Widget tests for counter and button logic.

pubspec.yaml: Dependencies and asset configuration (for example, Flutter SDK and any state management or storage packages).

Recommended tools

VS Code or Android Studio with Flutter and Dart plugins, plus Flutter DevTools for debugging and profiling.​

Issues, roadmap, and contact
Known limitations

SegmentedButton may clear selection if misconfigured; set emptySelectionAllowed: false and initialize _selectedSize in initState.

DropdownMenuEntry.label must be a widget; wrap enum names with Text(...) to avoid runtime TypeError.

Dart does not support string multiplication; use List.filled(n, '🥪').join() to repeat emoji.

Orders are kept only in memory, so app restarts clear current data.

Planned improvements

Persist orders using shared_preferences or sqflite.

Add confirmation and summary screens.

Support editing existing items (size, bread, notes).

Enhance accessibility and visual design.

Contributions & contact

For larger changes, open an issue first, then fork, branch, add tests, and submit a focused pull request describing any breaking changes.

Project owner: Dan Gardner 
contact at Daniel.t.gardner@hotmail.com.