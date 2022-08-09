import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/service_locator.dart';

/// ViewModel managing data that is part of the HomePage
class HomeViewModel extends ChangeNotifier {

  /// Name fetched stored in DB
  String _name = '';
  String get name => _name;

  /// Main request service
  final WidgetbookApi _widgetbookApi = locator<WidgetbookApi>();

  /// Send name to the server
  /// returns true if request is a success, false otherwise
  Future<bool> sendName(String name) async {
    try {
      await _widgetbookApi.welcomeToWidgetbook(message: name);
      _name = name;
      return true;
    }
    catch (exception) {
      print(exception);
      return false;
    }
  }
}