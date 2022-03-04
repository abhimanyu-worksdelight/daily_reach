class NotificationModel {
  int? status;
  List<NotificationData>? data;
  String? message;

  NotificationModel({this.status, this.data, this.message});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(new NotificationData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class NotificationData {
  int? id;
  String? title;
  String? description;
  String? postId;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? notificationsResponse;
  int? is_read;

  NotificationData(
      {this.id,
      this.title,
      this.description,
      this.postId,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.notificationsResponse, this.is_read});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    postId = json['post_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    notificationsResponse = json['notifications_response'];
    is_read = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['post_id'] = this.postId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    data['notifications_response'] = this.notificationsResponse;
    data['is_read'] = this.is_read;
    return data;
  }
}
