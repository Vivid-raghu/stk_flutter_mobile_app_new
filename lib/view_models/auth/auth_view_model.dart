import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../core/base/base_view_model.dart';
import '../../models/auth_response_model.dart';
import '../../models/user_model.dart';
import '../../utils/token_storage.dart';

class LoginViewModel extends BaseViewModel {
  final User _user = User(username: '', password: '');
  bool _isPasswordInvisible = true;
  String version = "";

  String get username => _user.username;
  String get password => _user.password;
  bool get isPasswordInvisible => _isPasswordInvisible;

  LoginViewModel() {
    _initializeViewModel();
  }

  Future<void> _initializeViewModel() async {
    await _getAppVersion();
    // await getDeviceId();
  }

  Future<void> _getAppVersion() async {
    try {
      version = (await PackageInfo.fromPlatform()).version;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to get app version: $e');
    }
  }

  void setUsername(String email) {
    _user.username = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _user.password = password;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordInvisible = !_isPasswordInvisible;
    notifyListeners();
  }

  void clearCredentials() {
    _user.username = '';
    _user.password = '';
    notifyListeners();
  }

  Future<void> logoutCredentials() async {
    try {
      await SecureStorage.deleteAccessToken();
      await SecureStorage.deleteUsername();
      await SecureStorage.deleteUserId();
      await SecureStorage.deleteIdToken();
      await SecureStorage.deleteAll();
      await OneSignal.logout();
      clearCredentials();
    } catch (e) {
      debugPrint('Logout error: $e');
    }
  }

  Future<(bool, dynamic)> login(BuildContext context) async {
    if (_user.username.isEmpty || _user.password.isEmpty) {
      setMessage('Please fill in all fields.');
      toggleShowSnackBar(true);
      return (false, null);
    }

    final data = {
      "username": _user.username.trim(),
      "password": _user.password.trim(),
    };

    toggleShowLoader(true);
    clearMessage();
    toggleShowSnackBar(false);

    try {
      final response = await apiService.loginPost(
        "/auth/login",
        Map<String, dynamic>.from(data),
      );

      toggleShowLoader(false);

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);
        print("Response ---> ${loginResponse.data}");
        // await SecureStorage.storeToken(loginResponse.token);
        // await SecureStorage.storeName(loginResponse.data.userName);
        // await SecureStorage.saveCredentials(_user.username, _user.password);
        // await SecureStorage.storeUserId(loginResponse.data.id.toString());
        // await OneSignal.login(loginResponse.data.id.toString());
        return (true, loginResponse);
      } else {
        _handleLoginFailure(response.data);
        return (false, null);
      }

    } on DioException catch (dioException) {
      _handleDioException(dioException);
      toggleShowLoader(false);
      toggleShowSnackBar(true);
      return (false, null);

    } catch (e) {
      toggleShowLoader(false);
      setMessage('Login failed. Please try again later.');
      toggleShowSnackBar(true);
      return (false, null);
    }
  }

  void _handleLoginFailure(dynamic data) {
    if (data != null && data is Map<String, dynamic>) {
      setMessage('Login failed. ${data['message'] ?? 'Please check your credentials.'}');
    } else {
      setMessage('Login failed. Please check your credentials.');
    }
    toggleShowSnackBar(true);
    toggleShowLoader(false);
  }

  void _handleDioException(DioException exception) {
    final response = exception.response;
    dynamic data = response?.data;

    String errorMessage = 'Login failed. Please try again later.';

    if (data is Map<String, dynamic>) {
      if (data['error'] == "no response from server") {
        errorMessage = "No response from server. Please try again later.";
      } else {
        errorMessage = data['message'] != null
            ? "${data['message']}. Please check your credentials."
            : data['error'] ?? errorMessage;
      }
    } else if (response != null) {
      final statusCode = response.statusCode;
      final statusMessage = response.statusMessage ?? 'Unknown Error';
      errorMessage = '$statusCode $statusMessage';
    }

    setMessage(errorMessage);
  }
}
