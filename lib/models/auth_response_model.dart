class LoginResponse {
  String code;
  String message;
  Data data;

  LoginResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      data: Data.fromJson(json['data'] ?? {}),
    );
  }
}

class Data {
  UserData userData;
  Session session;
  String expiresIn;

  Data({
    required this.userData,
    required this.session,
    required this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userData: UserData.fromJson(json['userData'] ?? {}),
      session: Session.fromJson(json['session'] ?? {}),
      expiresIn: json['expiresIn'] ?? '',
    );
  }
}

class Session {
  String id;
  String accessToken;
  String idToken;
  String refreshToken;
  bool valid;
  DateTime createdAt;

  Session({
    required this.id,
    required this.accessToken,
    required this.idToken,
    required this.refreshToken,
    required this.valid,
    required this.createdAt,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'] ?? '',
      accessToken: json['accessToken'] ?? '',
      idToken: json['idToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      valid: json['valid'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}

class UserData {
  String id;
  String firstName;
  String lastName;
  String fullName;
  String gpfCpsNo;
  String address;
  String phone;
  String email;
  DateTime modifiedAt;
  DateTime lastLogin;
  String policeStationId;
  String stateId;
  String adminId;
  String zoneId;
  String rangeId;
  String districtId;
  String subDivisionId;
  String rankId;
  String roleId;
  Rank rank;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.gpfCpsNo,
    required this.address,
    required this.phone,
    required this.email,
    required this.modifiedAt,
    required this.lastLogin,
    required this.policeStationId,
    required this.stateId,
    required this.adminId,
    required this.zoneId,
    required this.rangeId,
    required this.districtId,
    required this.subDivisionId,
    required this.rankId,
    required this.roleId,
    required this.rank,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      fullName: json['fullName'] ?? '',
      gpfCpsNo: json['gpfCpsNo'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      modifiedAt: DateTime.tryParse(json['modifiedAt'] ?? '') ?? DateTime.now(),
      lastLogin: DateTime.tryParse(json['lastLogin'] ?? '') ?? DateTime.now(),
      policeStationId: json['policeStationId'] ?? '',
      stateId: json['stateId'] ?? '',
      adminId: json['adminId'] ?? '',
      zoneId: json['zoneId'] ?? '',
      rangeId: json['rangeId'] ?? '',
      districtId: json['districtId'] ?? '',
      subDivisionId: json['subDivisionId'] ?? '',
      rankId: json['rankId'] ?? '',
      roleId: json['roleId'] ?? '',
      rank: Rank.fromJson(json['rank'] ?? {}),
    );
  }
}

class Rank {
  String rankName;
  String rankCode;
  Role role;

  Rank({
    required this.rankName,
    required this.rankCode,
    required this.role,
  });

  factory Rank.fromJson(Map<String, dynamic> json) {
    return Rank(
      rankName: json['rankName'] ?? '',
      rankCode: json['rankCode'] ?? '',
      role: Role.fromJson(json['role'] ?? {}),
    );
  }
}

class Role {
  String roleCode;
  String roleName;

  Role({
    required this.roleCode,
    required this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleCode: json['roleCode'] ?? '',
      roleName: json['roleName'] ?? '',
    );
  }
}
