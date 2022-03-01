class Product {
  final String name;
  final String description;
  final String image;
  final String price;
  final Sender sender;

  Product(
      {required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.sender});
}

class Sender {
  final String name;
  final String email;

  Sender({required this.name, required this.email});
}
