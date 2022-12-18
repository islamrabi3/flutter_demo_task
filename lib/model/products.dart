// import 'package:equatable/equatable.dart';

// class ProductModel extends Equatable {
//   final ProductModelData productModelData;

//   const ProductModel({required this.productModelData});

//   factory ProductModel.fromJson(Map<String, dynamic> json) =>
//       ProductModel(productModelData: ProductModelData.fromJson(json['data']));
//   @override
//   List<Object?> get props => [ProductModelData];
// }

// class ProductModelData extends Equatable {
//   final List<Products> productList;

//   const ProductModelData({required this.productList});
//   factory ProductModelData.fromJson(Map<String, dynamic> json) =>
//       ProductModelData(
//           productList: List<Products>.from(
//               ((json['products'])).map((e) => Products.fromJson(e))));
//   @override
//   List<Object?> get props => [productList];
// }

// class Products extends Equatable {
//   final dynamic id;
//   final dynamic price;
//   final dynamic oldPrice;
//   final dynamic discount;
//   final String image;
//   final String name;

//   const Products({
//     required this.id,
//     required this.price,
//     required this.oldPrice,
//     required this.discount,
//     required this.image,
//     required this.name,
//   });
//   factory Products.fromJson(Map<String, dynamic> json) => Products(
//       id: json['id'],
//       price: json['price'],
//       oldPrice: json['old_price'],
//       discount: json['discount'],
//       image: json['image'],
//       name: json['name']);

//   @override
//   List<Object?> get props => [id, price, oldPrice, discount, image, name];
// }
