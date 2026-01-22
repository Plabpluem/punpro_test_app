class Product {
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.images,
    this.thumbnail,
  });

  int? id;
  String? title;
  String? description;
  num? price;
  List<String>? images;
  String? thumbnail;

  Product.fromJson(Map<String,dynamic> json){
    id = json['id'] as int;
    title = json['title'] as String;
    description = json['description'] as String;
    price = json['price'] as num;
    images = List<String>.from(json['images']);
    thumbnail = json['thumbnail'] as String;
  }
}
