class Crypto {
  final String name;
  final double price;

  Crypto({required this.name, required this.price});

  factory Crypto.fromJson(String name, Map<String, dynamic> json) {
    return Crypto(name: name.toUpperCase(), price: json['idr'].toDouble());
  }
}
