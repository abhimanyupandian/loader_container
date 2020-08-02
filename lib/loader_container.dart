library loader_container;

import 'package:flutter/material.dart';

class LoaderContainer extends StatefulWidget {
  final Widget loadingWidget;
  final Widget child;
  final bool isDismissable;
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

class _LoaderContainerState extends State<LoaderContainer> {
  final Widget _defaultLoadingWidget = Center(
    child: Column(
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 20.0,
        ),
        Text("Loading...")
      ],
    ),
  );

  Widget _getLoader() {
    if (widget.loadingWidget == null) {
      return _defaultLoadingWidget;
    }
    return widget.loadingWidget;
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

class LoaderController extends ValueNotifier<bool> {
  bool value = false;
  LoaderController(this.value) : super(value);
}
