import 'package:flutter/material.dart';

import 'name_dialog.dart';

/// Default value for all paddings in this screen
const double defaultPadding = 20;

/// Size of titles
const double h1 = 30;
const double h2 = 20;
const double h3 = 15;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Challenge'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Hello Flutter enthusiast !',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: h2),
            ),
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.all(Radius.circular(defaultPadding / 2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: const Text(
                'Are you ready to get out of the matrix ? '
                'Take your time to make your decision, '
                'because there is no coming back. '
                '\n\nWhen you are ready, please tap on the Start button.',
                textAlign: TextAlign.start,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (_) => NameDialog(),
                );
              },
              child: const Text('Start'),
            )
          ],
        ),
      ),
    );
  }
}
