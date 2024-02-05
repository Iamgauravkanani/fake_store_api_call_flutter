class ApiModel {
  int id;
  String title;
  var price;
  String description;
  String category;
  String image;

  ApiModel({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });

  factory ApiModel.fromJSON({required Map data}) {
    return ApiModel(
      category: data['category'],
      description: data['description'],
      id: data['id'],
      image: data['image'],
      price: data['price'],
      title: data['title'],
    );
  }
}
