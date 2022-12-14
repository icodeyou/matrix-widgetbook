import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/ui/home_page.dart';

/// The app.
class App extends StatelessWidget {
  /// Creates a new instance of [App].
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
