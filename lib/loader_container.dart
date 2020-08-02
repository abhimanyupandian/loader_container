library loader_container;

import 'package:flutter/material.dart';

/// The main widget that encompasses the page that shows the loading widget.
class LoaderContainer extends StatefulWidget {
  // The widget that is displayed while loading.
  final Widget loadingWidget;
  // The widget that is displayed while not loading.
  final Widget child;
  // Signifies if the loading screen is dismissable.
  // TODO: This is yet to be implemented.
  final bool isDismissable;
  // The LoaderController that is used to toggle between loading and  not loading.
  final LoaderController controller;
  LoaderContainer(
      {Key key,
      this.child,
      this.controller,
      this.loadingWidget,
      this.isDismissable = false})
      : assert(controller != null),
        assert(child != null);

  @override
  _LoaderContainerState createState() => _LoaderContainerState();
}

/// The main widget that encompasses the page that shows the loading widget.
class _LoaderContainerState extends State<LoaderContainer> {
  // The default loading widget that is displayed if no custom widget is provided.
  Widget _defaultLoadingWidget;

  // Returns the loading widget based on user input.
  Widget _getLoader() {
    if (widget.loadingWidget == null) {
      return _defaultLoadingWidget;
    }
    return widget.loadingWidget;
  }

  @override
  void initState() {
    super.initState();
    _defaultLoadingWidget = Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      builder: (BuildContext context, bool value, Widget child) {
        return Container(
            child: Stack(
          children: [if (!value) widget.child, if (value) _getLoader()],
        ));
      },
      valueListenable: widget.controller,
    );
  }
}

/// The ValueNotifier controller that is used to toggle between loading and not loading.
class LoaderController extends ValueNotifier<bool> {
  // Stores the state of loading, whether true (loading) or false (not loading).
  bool _value;
  LoaderController(this._value) : super(_value);

  // Returns the state of loading.
  @override
  get value => _value;

  // Sets the state of loading.
  @override
  set value(newValue) {
    _value = newValue;
    notifyListeners();
  }
}
