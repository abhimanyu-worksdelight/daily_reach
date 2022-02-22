class GeneralSettingModel {
  int? status;
  String? message;
  GeneralSettingsData? data;

  GeneralSettingModel({this.status, this.message, this.data});

  GeneralSettingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new GeneralSettingsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GeneralSettingsData {
  int? id;
  String? appLogo;
  Null? contactEmails;
  String? terms;
  String? privacyPolicy;
  Null? disclaimer;
  Null? createdAt;
  String? updatedAt;
  String? appName;
  String? introVideo;

  GeneralSettingsData(
      {this.id,
      this.appLogo,
      this.contactEmails,
      this.terms,
      this.privacyPolicy,
      this.disclaimer,
      this.createdAt,
      this.updatedAt,
      this.appName,
      this.introVideo});

  GeneralSettingsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appLogo = json['app_logo'];
    contactEmails = json['contact_emails'];
    terms = json['terms'];
    privacyPolicy = json['privacy_policy'];
    disclaimer = json['disclaimer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    appName = json['app_name'];
    introVideo = json['intro_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['app_logo'] = this.appLogo;
    data['contact_emails'] = this.contactEmails;
    data['terms'] = this.terms;
    data['privacy_policy'] = this.privacyPolicy;
    data['disclaimer'] = this.disclaimer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['app_name'] = this.appName;
    data['intro_video'] = this.introVideo;
    return data;
  }
}