import 'dart:math' as math;

import 'package:flutter/material.dart';

const defaultValue = 56.0;

class Loader extends StatefulWidget {
  static OverlayEntry? _currentLoader;

  const Loader._(this._progressIndicator, this._themeData);

  final Widget? _progressIndicator;
  final ThemeData? _themeData;

  static OverlayState? _overlayState;

  /// If you need to check your loader is being shown or
  /// not just call the property ```Loader.isShown'''
  static bool get isShown => _currentLoader != null;

  /// If you need to show an normal overlayloader,
  /// just call ```Loader.show(context)``` with a build context.
  /// BuildContext is a required param.

  static void show(
    BuildContext context, {
    /// Define your custom progress indicator if you want [optional]
    Widget? progressIndicator,

    /// Define Theme [optional]
    ThemeData? themeData,

    /// Define Overlay color [optional]
    Color? overlayColor,

    /// overlayTop mean overlay start from Top margin.
    ///
    /// If you have custom appbar and you want to show loader without custom
    /// appbar then will be custom appbar height here and also you have to make
    /// sure [isAppbarOverlay = false].
    double? overlayFromTop,

    /// overlayFromBottom mean overlay end to Bottom margin.
    ///
    /// If you have custom BottomAppBar and you want to show loader without
    /// custom BottomAppBar then will be custom BottomAppBar height here and
    /// also you have to make sure [isBottomBarOverlay = false].
    double? overlayFromBottom,

    /// isAppbarOverlay default true.
    ///
    /// If you need to appbar outside from overlay loader then make it false.
    bool isAppbarOverlay = true,

    /// isBottomBarOverlay default true.
    ///
    /// If you need to BottomBar outside from overlay loader then make it false.
    bool isBottomBarOverlay = true,

    /// isSafeAreaOverlay default true.
    ///
    /// If you don't want to overlay  your safe area like statusBar and
    /// bottomNavBar then make it false.
    bool isSafeAreaOverlay = true,
  }) {
    var safeBottomPadding = MediaQuery.of(context).padding.bottom;
    var defaultPaddingTop = 0.0;
    var defaultPaddingBottom = 0.0;
    if (!isAppbarOverlay) {
      isSafeAreaOverlay = false;
    }
    if (!isSafeAreaOverlay) {
      defaultPaddingTop = defaultValue;
      defaultPaddingBottom = defaultValue + safeBottomPadding;
    } else {
      defaultPaddingTop = defaultValue;
      defaultPaddingBottom = defaultValue;
    }

    _overlayState = Overlay.of(context);
    if (_currentLoader == null) {
      ///Create current Loader Entry
      _currentLoader = OverlayEntry(builder: (context) {
        return Stack(
          children: <Widget>[
            _overlayWidget(
                isSafeAreaOverlay,
                overlayColor ?? const Color(0x99ffffff),
                isAppbarOverlay ? 0.0 : overlayFromTop ?? defaultPaddingTop,
                isBottomBarOverlay ? 0.0 : overlayFromBottom ?? defaultPaddingBottom),
            Center(
                child: Loader._(
              progressIndicator,
              themeData,
            )),
          ],
        );
      });

      try {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_currentLoader != null) {
            _overlayState?.insert(_currentLoader!);
          }
        });
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  static Widget _overlayWidget(bool isSafeArea, Color overlayColor, double overlayFromTop, double overlayFromBottom) {
    return isSafeArea
        ? Container(
            color: overlayColor,
            margin: EdgeInsets.only(top: overlayFromTop, bottom: overlayFromBottom),
          )
        : SafeArea(
            child: Container(
            color: overlayColor,
            margin: EdgeInsets.only(top: overlayFromTop, bottom: overlayFromBottom),
          ));
  }

  /// You have to call ```Loader.hide()``` method inside the [dispose()] to clear loader.
  ///
  ///  The overlay or hide your loader when your view is disposed otherwise
  ///  [throws] an exception.
  /// And also you have to call ```Loader.hide()``` method when you need to hide
  /// your overlay loader.
  ///
  /// For example,
  /// After finishing your api call you need to hide your loader.
  /// then just call ```Loader.hide()```
  static void hide() {
    if (_currentLoader != null) {
      try {
        _currentLoader?.remove();
        _currentLoader?.dispose();
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        _currentLoader = null;
      }
    }
  }

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
    ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Center(
            child: Theme(
                data: widget._themeData ??
                    Theme.of(context).copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue)),
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (_, child) {
                      return Transform.rotate(
                        angle: _controller.value * 2 * math.pi,
                        child: child,
                      );
                    },
                    child: widget._progressIndicator ?? const CircularProgressIndicator(),
                  ),
                ))));
  }
}
