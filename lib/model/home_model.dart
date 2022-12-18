import 'package:equatable/equatable.dart';

class HomeModelData extends Equatable {
  final HomeData bannerModelData;

  const HomeModelData({required this.bannerModelData});

  factory HomeModelData.fromJson(Map<String, dynamic> json) =>
      HomeModelData(bannerModelData: HomeData.fromJson(json['data']));
  @override
  List<Object?> get props => [bannerModelData];
}

class HomeData extends Equatable {
  final List<Banners> bannersList;
  final List<Products> productsList;

  const HomeData({required this.bannersList, required this.productsList});
  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
      bannersList: List<Banners>.from(
          ((json['banners'])).map((e) => Banners.fromJson(e))),
      productsList: List<Products>.from(
          ((json['products'])).map((e) => Products.fromJson(e))));
  @override
  List<Object?> get props => [bannersList];
}

class Products extends Equatable {
  final dynamic id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;

  const Products({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
  });
  factory Products.fromJson(Map<String, dynamic> json) => Products(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name']);

  @override
  List<Object?> get props => [id, price, oldPrice, discount, image, name];
}

class Banners extends Equatable {
  final dynamic id;
  final String? image;

  const Banners({required this.id, required this.image});

  factory Banners.fromJson(Map<String, dynamic> json) =>
      Banners(id: json['id'], image: json['image']);

  @override
  List<Object?> get props => [id, image];
}
