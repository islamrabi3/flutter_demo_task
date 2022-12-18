import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final CategoryListModel firstDataElement;

  const CategoryModel({required this.firstDataElement});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(firstDataElement: CategoryListModel.fromJson(json['data']));

  @override
  List<Object?> get props => [firstDataElement];
}

class CategoryListModel extends Equatable {
  final List<CategoryData> data;

  const CategoryListModel({required this.data});
  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
          data: List<CategoryData>.from(
              ((json['data'])).map((e) => CategoryData.fromJson(e))));

  @override
  List<Object?> get props => [data];
}

class CategoryData extends Equatable {
  final int id;
  final String name;
  final String image;

  const CategoryData(
      {required this.id, required this.name, required this.image});

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      CategoryData(id: json['id'], name: json['name'], image: json['image']);

  @override
  List<Object?> get props => [id, name, image];
}
