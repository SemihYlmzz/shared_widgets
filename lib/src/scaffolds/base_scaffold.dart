import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:keyboard_detection/keyboard_detection.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    required this.body,
    super.key,

    ///
    // Additional
    this.safeArea = false,
    this.safeAreaBottom = false,
    this.safeAreaRight = false,
    this.safeAreaTop = false,
    this.safeAreaLeft = false,
    this.unFocusOnScaffoldTap = true,
    this.onScaffoldDoubleTap,
    this.isKeyboardOpen,
    this.initAnimationDelay,

    ///
    // Default Scaffold
    this.appBar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.drawerEdgeDragWidth,
    this.drawerScrimColor,
    this.endDrawer,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.persistentFooterButtons,
    this.resizeToAvoidBottomInset,
    this.restorationId,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.primary = true,
  });
  final bool safeArea;
  final bool safeAreaBottom;
  final bool safeAreaRight;
  final bool safeAreaTop;
  final bool safeAreaLeft;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final double? drawerEdgeDragWidth;
  final Color? drawerScrimColor;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final void Function({bool onDrawerChanged})? onDrawerChanged;
  final void Function({bool onEndDrawerChanged})? onEndDrawerChanged;
  final List<Widget>? persistentFooterButtons;
  final bool? resizeToAvoidBottomInset;
  final String? restorationId;
  final bool unFocusOnScaffoldTap;
  final Function? onScaffoldDoubleTap;
  final DragStartBehavior drawerDragStartBehavior;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final AlignmentDirectional persistentFooterAlignment;
  final bool primary;
  final Widget body;
  final Function(bool)? isKeyboardOpen;
  final Duration? initAnimationDelay;

  @override
  Widget build(BuildContext context) {
    bool isClosed = false;
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: FocusManager.instance.rootScope.focusedChild?.unfocus,
      onDoubleTap: onScaffoldDoubleTap?.call(),
      child: PopScope(
        canPop: true,
        child: KeyboardDetection(
          controller: KeyboardDetectionController(
            onChanged: isKeyboardOpen,
          ),
          child: Scaffold(
            appBar: appBar,
            backgroundColor: backgroundColor,
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            drawer: drawer,
            drawerEdgeDragWidth: drawerEdgeDragWidth,
            drawerScrimColor: drawerScrimColor,
            endDrawer: endDrawer,
            floatingActionButton: floatingActionButton,
            floatingActionButtonAnimator: floatingActionButtonAnimator,
            floatingActionButtonLocation: floatingActionButtonLocation,
            onDrawerChanged: (bool onDrawerChanged) => onDrawerChanged,
            onEndDrawerChanged: (bool onEndDrawerChanged) => onEndDrawerChanged,
            persistentFooterButtons: persistentFooterButtons,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            restorationId: restorationId,
            drawerDragStartBehavior: drawerDragStartBehavior,
            drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
            endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
            extendBody: extendBody,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            persistentFooterAlignment: persistentFooterAlignment,
            primary: primary,
            key: key,
            body: SafeArea(
              bottom: safeArea || safeAreaBottom,
              right: safeArea || safeAreaRight,
              top: safeArea || safeAreaTop,
              left: safeArea || safeAreaLeft,
              child: Animate(
                effects: initAnimationDelay != null
                    ? [
                        const FadeEffect(),
                        const ScaleEffect(
                          begin: Offset(0.85, 0.85),
                          curve: Curves.easeIn,
                        ),
                      ]
                    : [],
                delay: initAnimationDelay,
                child: StatefulBuilder(
                  builder: (context, setBuilderState) {
                    isClosed = true;

                    return SizedBox(
                      width: size.width,
                      child: body,
                    );
                  },
                ),
              ),
              // .animate(target: isClosed ? 1 : 0)
              // .fadeOut(curve: Curves.easeIn)
              // .scale(
              // end: const Offset(0.85, 0.85),
              // curve: Curves.easeIn,
              // ),
            ),
          ),
        ),
      ),
    );
  }

  final PreferredSizeWidget? appBar;
}
