import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// Implements the basic Flutter Design visual layout structure.
///
/// This class provides APIs for showing drawers and bottom sheets.
abstract base class FlutterPage extends StatefulWidget {
  /// Creates a visual scaffold for Flutter Design widgets.
  const FlutterPage({super.key});

  @override
  FlutterPageState createState();
}

abstract base class FlutterPageState extends State<FlutterPage> {
  /// Which extends the height of the body to the top of the page.
  bool get extendBody => false;

  /// If true, and an [buildAppBar] is specified, 
  /// then the height of the [buildBody] is extended to include 
  /// the height of the app bar and the top of the body 
  /// is aligned with the top of the app bar.
  bool get extendBodyBehindAppBar => false;

  /// Determines if the [Scaffold.drawer] can be opened with a drag gesture on mobile.
  ///
  /// On desktop platforms, the drawer is not draggable.
  ///
  /// By default, the drag gesture is enabled on mobile.
  bool get enableOpenDragGesture => kIsMobile;

  /// Responsible for determining where the [FloatingActionButton] should go.
  ///
  /// If null, the [ScaffoldState] will use the default location,
  /// [FloatingActionButtonLocation.endFloat].
  FloatingActionButtonLocation get floatingActionButtonLocation =>
      FloatingActionButtonLocation.endFloat;

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      endDrawer: buildEndDrawer(),
      bottomSheet: buildBottomSheet(),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildFloatingActionButton(),
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerEnableOpenDragGesture: enableOpenDragGesture,
      endDrawerEnableOpenDragGesture: enableOpenDragGesture,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  /// The primary content of the scaffold.
  Widget? buildBody();

  /// A panel displayed to the side of the [buildBody],
  /// often hidden on mobile devices.
  Widget? buildDrawer() => null;

  /// A panel displayed to the side of the [buildBody],
  /// often hidden on mobile devices.
  Widget? buildEndDrawer() => null;

  /// The persistent bottom sheet to display.
  Widget? buildBottomSheet() => null;

  /// An app bar to display at the top of the scaffold.
  PreferredSizeWidget? buildAppBar() => null;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  Widget? buildBottomNavigationBar() => null;

  /// A button displayed floating above [buildBody],
  /// in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  Widget? buildFloatingActionButton() => null;
}
