import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/service_locator.dart';
import 'package:widgetbook_challenge/viewmodels/home_viewmodel.dart';

/// AlertDialog that can be showed to save the name.
/// This class has to be used in the `showDialog()` method.
class NameDialog extends StatefulWidget {
  /// Creates a new instance of [NameDialog].
  NameDialog({Key? key}) : super(key: key);

  @override
  State<NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<NameDialog> {
  /// Key that is used for the short name form
  final _formKey = GlobalKey<FormState>();

  String _nameToSend = '';

  bool _isLoading = false;

  /// HomeViewModel, fetched by GetIt
  final HomeViewModel model = locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('What is your name ?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: !_isLoading,
            child: Form(
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
                    } else {
                      _nameToSend = value;
                    }
                  }
                },
              ),
            ),
          ),
          Visibility(
            visible: _isLoading,
            child: const CircularProgressIndicator(),
          )
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Valider'),
          onPressed: () async {
            if (_formKey.currentState?.validate() == true) {
              setState(() {
                _isLoading = true;
              });
              final navigatorState = Navigator.of(context);
              final messenger = ScaffoldMessenger.of(context);
              final response = await model.sendName(_nameToSend);
              navigatorState.pop();

              final String snackMessage;
              if (response) {
                snackMessage = 'Your name is ${model.name}';
              } else {
                snackMessage =
                    "We couldn't save your name because of an internal error";
              }
              messenger.showSnackBar(SnackBar(content: Text(snackMessage)));
            }
          },
        ),
      ],
    );
  }
}
