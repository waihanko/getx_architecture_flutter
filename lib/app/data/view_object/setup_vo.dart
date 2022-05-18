class SetUpVo {
  int? id;
  String? name;
  String? image;
  bool? isSelect;
  List<SetUpVo>? subCategory;

  SetUpVo({this.id, this.name, this.image, this.isSelect});

  SetUpVo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    isSelect = json['isSelect'];
    if (json['subCategory'] != null) {
      subCategory = <SetUpVo>[];
      json['subCategory'].forEach((v) {
        subCategory!.add( SetUpVo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['isSelect'] = isSelect;
    return data;
  }
}
