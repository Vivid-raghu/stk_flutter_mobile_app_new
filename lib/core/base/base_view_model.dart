import 'package:flutter/material.dart';

import '../../services/api_service.dart';

class BaseViewModel extends ChangeNotifier{
  String _message = '';
  bool _showSnackBar = false;
  bool _showLoader = false;

  String get message => _message;
  bool get showSnackBar => _showSnackBar;
  bool get showLoader => _showLoader;
  final ApiService apiService = ApiService();

  void toggleShowSnackBar(bool showSnackBar) {
    _showSnackBar = showSnackBar;
    notifyListeners();
  }

  void toggleShowLoader(bool showLoader) {
    _showLoader = showLoader;
    notifyListeners();
  }

  void setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  void clearMessage() {
    _message = '';
    notifyListeners();
  }
}


