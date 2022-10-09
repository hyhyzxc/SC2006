class Product {

  String id;
  String code;
  String name;
  String description;
  String image;
  int price;
  String category;
  int quantity;
  String inventoryStatus;
  int rating;
  double lat;
  double lng;
  String coor;

  Product({this.id = "",
    this.code = "",
    this.name = "",
    this.description = "",
    this.image = "",
    this.price = 0,
    this.category = "",
    this.quantity = 0,
    this.inventoryStatus = "",
    this.rating = 0,
    this.lat = 0.0,
    this.lng = 0.0,
    this.coor = ""});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        code: json['code'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
        category: json['category'],
        quantity: json['quantity'],
        inventoryStatus: json['inventoryStatus'],
        rating: json['rating'],
        lat: json['lat'],
        lng: json['lng'],
        coor: json['coor']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['category'] = this.category;
    data['quantity'] = this.quantity;
    data['inventoryStatus'] = this.inventoryStatus;
    data['rating'] = this.rating;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['coor'] = this.coor;
    return data;
  }

}