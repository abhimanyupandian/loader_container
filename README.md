# loader_container

A Simple Loader Widget for Flutter! Easily show loading widgets when your page is doing tasks in the background!

# 💾 Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  loader_container: <latest version>
```

# 📦 Usage

### Import this class

```dart
import 'package:loader_container/loader_container.dart';
```

### Basic structure

```dart
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoaderContainer(
          controller: _controller,
          loadingWidget: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                RaisedButton(
                  onPressed: () {
                    _controller.value = false;
                  },
                  child: Center(
                    child: Text("Dismiss Loading!"),
                  ),
                )
              ],
            ),
          ),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
```

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
