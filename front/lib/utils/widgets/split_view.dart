import 'package:flutter/material.dart';

const _kDefaultWidth = 300.0;

const _kDefaultBreakpoint = 500.0;

typedef PageBuilder = Page Function({
  required LocalKey key,
  required Widget child,
  String? title,
  Object? arguments,
  String? restorationId,
  bool? fullscreenDialog,
});

MaterialPage<void> _materialPageBuilder({
  required LocalKey key,
  required Widget child,
  String? title,
  Object? arguments,
  String? restorationId,
  bool? fullscreenDialog,
}) =>
    MaterialPage<void>(
      name: title,
      arguments: arguments,
      key: key,
      restorationId: restorationId,
      child: child,
      fullscreenDialog: fullscreenDialog ?? false,
    );

class _PageConfig {
  final Widget child;
  final String? name;
  final Object? arguments;
  final String? restorationId;
  final bool? fullscreenDialog;

  _PageConfig({
    required this.child,
    this.name,
    this.arguments,
    this.restorationId,
    this.fullscreenDialog,
  });
}

class SplitView extends StatefulWidget {
  const SplitView.material(
      {Key? key,
      required this.child,
      this.childWidth = _kDefaultWidth,
      this.breakpoint = _kDefaultBreakpoint,
      this.placeholder,
      this.title,
      this.hideDivider})
      : pageBuilder = _materialPageBuilder,
        super(key: key);

  static SplitViewState of(BuildContext context) {
    final state = context.findAncestorStateOfType<SplitViewState>();
    assert(state != null, 'No SplitViewState found in the context');
    return state!;
  }

  final double breakpoint;

  final Widget child;

  final double childWidth;

  final String? title;

  final Widget? placeholder;

  final PageBuilder pageBuilder;

  final bool? hideDivider;

  @override
  SplitViewState createState() => SplitViewState();
}

class SplitViewState extends State<SplitView> {
  var _pages = <Page>[];

  final _pageConfigs = <_PageConfig>[];

  var _splitted = false;

  @override
  void initState() {
    _pageConfigs.add(
      _PageConfig(child: widget.child, name: widget.title),
    );
    _updatePages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        _splitted = constrains.maxWidth >= widget.breakpoint;

        if (!_splitted) {
          return Navigator(
            pages: _pages,
            onPopPage: _onPopPage,
          );
        }

        return Row(
          children: <Widget>[
            SizedBox(
              width: widget.childWidth,
              child: Navigator(
                pages: [_pages.first],
                onPopPage: _onPopPage,
              ),
            ),
            const VerticalDivider(
              width: 5,
              thickness: 5,
            ),
            Expanded(
              child: ClipRect(
                clipBehavior: Clip.hardEdge,
                child: _buildSecondaryView(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSecondaryView() {
    if (_pages.length == 1) {
      return widget.placeholder ?? Container();
    }

    return Navigator(
      pages: _pages.sublist(1),
      onPopPage: _onPopPage,
    );
  }

  void push(
    Widget page, {
    String? title,
    Object? arguments,
    String? restorationId,
    bool? fullscreenDialog,
  }) {
    final pageConfig = _PageConfig(
      child: page,
      name: title,
      arguments: arguments,
      restorationId: restorationId,
      fullscreenDialog: fullscreenDialog,
    );

    _pageConfigs.add(pageConfig);

    setState(_updatePages);
  }

  bool pop() {
    if (_pageConfigs.length == 1) {
      return false;
    }

    _pageConfigs.removeLast();

    setState(_updatePages);
    return true;
  }

  /// Number of pages in the stack.
  int get pageCount => _pageConfigs.length;

  /// Replaces the page at [index] with [page].
  void replace({
    required int index,
    required Widget page,
    String? title,
    Object? arguments,
    String? restorationId,
    bool? fullscreenDialog,
  }) {
    _pageConfigs[index] = _PageConfig(
      child: page,
      name: title,
      arguments: arguments,
      restorationId: restorationId,
      fullscreenDialog: fullscreenDialog,
    );

    setState(_updatePages);
  }

  void popUntil(int index) {
    if (index < 0 || index >= pageCount) {
      throw ArgumentError('Index $index is out of bounds');
    }

    while (pageCount - 1 > index) {
      _pageConfigs.removeLast();
    }

    setState(_updatePages);
  }

  void setSecondary(
    Widget page, {
    String? title,
    Object? arguments,
    String? restorationId,
    bool? fullscreenDialog,
  }) {
    _pageConfigs.removeRange(1, _pageConfigs.length);

    _pageConfigs.add(
      _PageConfig(
        child: page,
        name: title,
        arguments: arguments,
        restorationId: restorationId,
        fullscreenDialog: fullscreenDialog,
      ),
    );

    setState(_updatePages);
  }

  bool get isSecondaryVisible {
    return _splitted;
  }

  void _updatePages() {
    final pages = <Page>[];
    for (var i = 0; i < _pageConfigs.length; i++) {
      final pageConfig = _pageConfigs[i];
      final pageKey = ValueKey(i);
      final page = widget.pageBuilder(
        key: pageKey,
        child: pageConfig.child,
        title: pageConfig.name,
        arguments: pageConfig.arguments,
        restorationId: pageConfig.restorationId,
      );
      pages.add(page);
    }
    _pages = pages;
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (_pageConfigs.length <= 1) {
      return false;
    }
    if (route.didPop(result)) {
      _pageConfigs.removeLast();
      _updatePages();
      return true;
    }
    return false;
  }
}
