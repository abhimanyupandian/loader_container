import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:loader_container/loader_container.dart';

void main() {
  testWidgets('Test LoaderContainerwidget', (WidgetTester tester) async {
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
    final Widget _child = Text("CHILD");
    final LoaderController _controller = LoaderController(false);

    await tester
        .pumpWidget(Scaffold(body: LoaderContainer(controller: _controller, child: _child),));
    expect(find.byWidget(_defaultLoadingWidget), findsOneWidget);
    expect(find.byWidget(_child), findsOneWidget);
    expect(find.byWidget(CircularProgressIndicator()), findsOneWidget);
    expect(find.byWidget(Text("Loading...")), findsOneWidget);
  });
}
