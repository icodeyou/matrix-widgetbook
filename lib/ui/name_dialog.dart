import 'package:flutter/material.dart';

/// AlertDialog that can be showed to save the name.
/// This class has to be used in the `showDialog()` method.
class NameDialog extends StatelessWidget {
  /// Creates a new instance of [NameDialog].
  NameDialog({Key? key}) : super(key: key);

  /// Ke that is used for the short name form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('What is your name ?'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            hintText: 'John Doe',
          ),
          validator: (value) {
            if (value != null) {
              if (value == '') {
                return 'Please provide a name';
              } else if (!RegExp(r'[A-zÀ-ÿ -]+$').hasMatch(value)) {
                return 'Your name is not valid';
              }
            }
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Valider'),
          onPressed: () async {
            if (_formKey.currentState?.validate() == true) {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
