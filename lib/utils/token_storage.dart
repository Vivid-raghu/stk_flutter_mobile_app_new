
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  // Private constructor
  SecureStorage._privateConstructor();

  // The single instance of TokenStorage
  static final SecureStorage _instance = SecureStorage._privateConstructor();

  // Factory constructor to return the same instance
  factory SecureStorage() {
    return _instance;
  }
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> storeAccessToken(String accessToken) async {
    await _storage.write(key: 'accessToken', value: accessToken);
  }
  static Future<void> storeRefreshToken(String refreshToken) async {
    await _storage.write(key: 'refreshToken', value: refreshToken);
  }

  static Future<void> storeIdToken(String idToken) async {
    await _storage.write(key: 'storeIdToken', value: idToken);
  }

  static Future<void> storeSessionId(String sessionId) async {
    await _storage.write(key: 'SessionId', value: sessionId);
  }
  static Future<void> storeUsername(String username) async {
    await _storage.write(key: 'Username', value: username);
  }

  static Future<void> storeUserId(String userId) async {
    await _storage.write(key: 'sessionId', value: userId);
  }

  static Future<void> storeRoleId(String roleId) async {
    await _storage.write(key: 'roleId', value: roleId);
  }

  static Future<void> storeRankCode(String rankCode) async {
    await _storage.write(key: 'rankCode', value: rankCode);
  }

  static Future<void> storeRankName(String rankName) async {
    await _storage.write(key: 'rankName', value: rankName);
  }

  static Future<void> storeFirstName(String firstName) async {
    await _storage.write(key: 'firstName', value: firstName);
  }

  static Future<void> storeLastName(String lastName) async {
    await _storage.write(key: 'lastName', value: lastName);
  }

  static Future<void> storeEmail(String email) async {
    await _storage.write(key: 'email', value: email);
  }

  static Future<void> storePhoneNumber(String phoneNumber) async {
    await _storage.write(key: 'phoneNumber', value: phoneNumber);
  }

  static Future<void> saveCredentials(String username, String password) async {
    await _storage.write(key: 'username', value: username);
    await _storage.write(key: 'password', value: password);
  }

  static Future<String> getSavedUsername() async {
    return await _storage.read(key: 'username') ?? '';
  }

  static Future<String> getAccessToken() async {
    return await _storage.read(key: 'accessToken') ?? '';
  }

  static Future<String> getRefreshToken() async {
   return await _storage.read(key: 'refreshToken') ?? '';
  }
  static Future<String> getIdToken() async {
   return await _storage.read(key: 'idToken') ?? '';
  }

  static Future<String> getSessionId() async  {
    return await _storage.read(key: 'sessionId') ?? '';
  }
  static Future<String> getUsername() async {
    return await _storage.read(key: 'username') ?? '';
  }

  static Future<String> getUserId() async {
   return await _storage.read(key: 'userId') ?? '';
  }
  static Future<String> getRoleId() async {
    return await _storage.read(key: 'roleId') ?? '';
  }

  static Future<String> getRankCode() async {
    return await _storage.read(key: 'rankCode') ?? '';
  }

  static Future<String> getRankName() async {
    return await _storage.read(key: 'rankName') ?? '';
  }

  static Future<String> getFirstName() async {
    return await _storage.read(key: 'firstName') ?? '';
  }

  static Future<String> getLastName() async {
    return await _storage.read(key: 'lastName') ?? '';
  }

  static Future<String> getEmail() async {
    return await _storage.read(key: 'email') ?? '';
  }

  static Future<String> getPhoneNumber() async {
    return await _storage.read(key: 'phoneNumber') ?? '';
  }

  static Future<void> deleteAccessToken() async {
    await _storage.delete(key: 'accessToken');
  }

  static Future<void> deleteRefreshToken() async {
    return await _storage.delete(key: 'refreshToken');
  }

  static Future<void> deleteIdToken() async {
    return await _storage.delete(key: 'idToken');
  }

  static Future<void> deleteSessionId() async {
    return await _storage.delete(key: 'sessionId');
  }

  static Future<void> deleteUsername() async {
    return await _storage.delete(key: 'username');
  }

  static Future<void> deleteUserId() async {
    return await _storage.delete(key: 'userId');
  }

  static Future<void> deleteRoleId() async {
    return await _storage.delete(key: 'roleId');
  }

  static Future<void> deleteRankCode() async {
    return await _storage.delete(key: 'rankCode');
  }

  static Future<void> deleteRankName() async {
    return await _storage.delete(key: 'rankName');
  }

  static Future<void> deleteFirstName() async {
    return await _storage.delete(key: 'firstName');
  }

  static Future<void> deleteLastName() async {
    return await _storage.delete(key: 'lastName');
  }

  static Future<void> deleteEmail() async {
    return await _storage.delete(key: 'email');
  }

  static Future<void> deletePhoneNumber() async {
    return await _storage.delete(key: 'phoneNumber');
  }


  static Future<void> deleteAll() async => await _storage.deleteAll();
}

