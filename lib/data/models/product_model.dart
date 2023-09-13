class ProductModel {
  String? sId;
  String? name;
  String? description;
  int? price;
  bool? isAdopted;
  List<String>? images;
  String? updatedOn;
  String? createdOn;

  ProductModel(
      {this.sId,
        this.name,
        this.description,
        this.price,
        this.isAdopted,
        this.images,
        this.updatedOn,
        this.createdOn});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    isAdopted = json['isAdopted'];
    images = json['images'].cast<String>();
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['isAdopted'] = this.isAdopted;
    data['images'] = this.images;
    data['updatedOn'] = this.updatedOn;
    data['createdOn'] = this.createdOn;
    return data;
  }
}