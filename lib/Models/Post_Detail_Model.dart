class PostDetailModel {
  int? status;
  PostDetailData? data;
  String? message;

  PostDetailModel({this.status, this.data, this.message});

  PostDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new PostDetailData.fromJson(json['data']) : null;
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

class PostDetailData {
  int? id;
  String? title;
  String? body;
  String? createdAt;
  String? updatedAt;
  String? categories;
  String? status;
  String? date;
  List<CategoriesData>? categoriesData;
  List<Banners>? banners;

  PostDetailData(
      {this.id,
      this.title,
      this.body,
      this.createdAt,
      this.updatedAt,
      this.categories,
      this.status,
      this.date,
      this.categoriesData,
      this.banners});

  PostDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categories = json['categories'];
    status = json['status'];
    date = json['date'];
    if (json['categories_data'] != null) {
      categoriesData = <CategoriesData>[];
      json['categories_data'].forEach((v) {
        categoriesData!.add(new CategoriesData.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['categories'] = this.categories;
    data['status'] = this.status;
    data['date'] = this.date;
    if (this.categoriesData != null) {
      data['categories_data'] =
          this.categoriesData!.map((v) => v.toJson()).toList();
    }
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  CategoriesData({this.id, this.name, this.createdAt, this.updatedAt});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Banners {
  int? id;
  int? postId;
  String? banner;
  String? type;
  String? createdAt;
  String? updatedAt;

  Banners(
      {this.id,
      this.postId,
      this.banner,
      this.type,
      this.createdAt,
      this.updatedAt});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    banner = json['banner'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['banner'] = this.banner;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}