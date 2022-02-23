
// class CategoryModel{

//   var name = "";
//   var isselected = false;
//   CategoryModel(this.name,this.isselected);
// }


class CategoryModel {
  int? status;
  List<CategoryData>? data;
  String? message;


  CategoryModel({this.status, this.data, this.message});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryData.fromJson(v));
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

class CategoryData {
  int? id;
  String? name;
  bool? isselected = false;

  CategoryData({this.id, this.name,this.isselected});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}