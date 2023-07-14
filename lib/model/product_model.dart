class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }
}

// class AutoGenerate {
//   AutoGenerate({
//     required this.products,
//     required this.total,
//     required this.skip,
//     required this.limit,
//   });
//   late final List<Products> products;
//   late final int total;
//   late final int skip;
//   late final int limit;
  
//   AutoGenerate.fromJson(Map<String, dynamic> json){
//     products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
//     total = json['total'];
//     skip = json['skip'];
//     limit = json['limit'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['products'] = products.map((e)=>e.toJson()).toList();
//     _data['total'] = total;
//     _data['skip'] = skip;
//     _data['limit'] = limit;
//     return _data;
//   }
// }

// class Products {
//   Products({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.discountPercentage,
//     required this.rating,
//     required this.stock,
//     required this.brand,
//     required this.category,
//     required this.thumbnail,
//     required this.images,
//   });
//   late final int id;
//   late final String title;
//   late final String description;
//   late final int price;
//   late final double discountPercentage;
//   late final double rating;
//   late final int stock;
//   late final String brand;
//   late final String category;
//   late final String thumbnail;
//   late final List<String> images;
  
//   Products.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     price = json['price'];
//     discountPercentage = json['discountPercentage'];
//     rating = json['rating'];
//     stock = json['stock'];
//     brand = json['brand'];
//     category = json['category'];
//     thumbnail = json['thumbnail'];
//     images = List.castFrom<dynamic, String>(json['images']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['title'] = title;
//     _data['description'] = description;
//     _data['price'] = price;
//     _data['discountPercentage'] = discountPercentage;
//     _data['rating'] = rating;
//     _data['stock'] = stock;
//     _data['brand'] = brand;
//     _data['category'] = category;
//     _data['thumbnail'] = thumbnail;
//     _data['images'] = images;
//     return _data;
//   }
// }