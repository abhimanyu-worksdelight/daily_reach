class EditProfileModel {
  int? status;
  EditProfileData? data;
  String? message;

  EditProfileModel({this.status, this.data, this.message});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new EditProfileData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class EditProfileData {
  int? id;
  String? name;
  String? email;
  var emailVerifiedAt;
  String? role;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? lastLogin;
  var deletedAt;
  var photo;
  String? oneSignalId;
  String? deviceInfo;
  String? appVersion;
  String? phone;

  EditProfileData(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.role,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.lastLogin,
      this.deletedAt,
      this.photo,
      this.oneSignalId,
      this.deviceInfo,
      this.appVersion,
      this.phone});

  EditProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastLogin = json['last_login'];
    deletedAt = json['deleted_at'];
    photo = json['photo'];
    oneSignalId = json['one_signal_id'];
    deviceInfo = json['device_info'];
    appVersion = json['app_version'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_login'] = this.lastLogin;
    data['deleted_at'] = this.deletedAt;
    data['photo'] = this.photo;
    data['one_signal_id'] = this.oneSignalId;
    data['device_info'] = this.deviceInfo;
    data['app_version'] = this.appVersion;
    data['phone'] = this.phone;
    return data;
  }
}