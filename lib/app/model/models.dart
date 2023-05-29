class MyModel {
  int? id;
  String? name;
  String? description;
  String? image;

  MyModel({this.id, this.name, this.description, this.image});

  MyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }
}
