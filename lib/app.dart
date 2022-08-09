import 'package:flutter/material.dart';

/// Default value for all paddings in this screen
const double defaultPadding = 20;

/// Size of titles
const double h1 = 30;
const double h2 = 20;
const double h3 = 15;

/// The app.
class App extends StatelessWidget {
  /// Creates a new instance of [App].
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Interview Challenge'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Text(
                'Hello Flutter enthusiast !',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: h2),
              ),
              const SizedBox(height: defaultPadding),
              const Text(
                'Are you ready to get out of the matrix ? '
                'Take your time to make your decision, '
                'because there is no coming back. '
                '\n\nWhen you are ready, please tap on the Start button.',
                textAlign: TextAlign.start,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Yay! A SnackBar!'),
                      ));
                    },
                    child: const Text('Start'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
