import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_app_task/core/shared/cache_helper.dart';
import 'package:flutter_demo_app_task/core/shared/dio_helper.dart';
import 'package:flutter_demo_app_task/model/home_model.dart';
import 'package:flutter_demo_app_task/model/category.dart';
import 'package:flutter_demo_app_task/model/products.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppController extends GetxController {
  @override
  void onInit() {
    getCategoryData();

    getAllHomeDataFromApi();

    CacheHelper.sharedPreferences!.setString('image',
        'https://th.bing.com/th/id/R.f5b21a546f1de9fd58c81c30bae95b75?rik=dF%2fglsY4a5khDQ&pid=ImgRaw&r=0');
    // print('data is ' '${CacheHelper.sharedPreferences!.getString('data')}');
    super.onInit();
  }

  RxInt count = 0.obs;

  var currentIndex = 0.obs;
  void toggleTweenScreens(index) {
    currentIndex.value = index;
    print(currentIndex.value);
  }

  var piecesCount = 1.obs;
  var price = 35;
  void increasecrPieceCount() {
    piecesCount++;
  }

  void decreasePieceCount() {
    if (piecesCount.value != 1) {
      piecesCount--;
    }
  }

  CategoryModel? categoryModel;
  var listOfCategoryData = <CategoryData>[].obs;

  void getCategoryData() async {
    if (await InternetConnectionChecker().hasConnection) {
      var response =
          await DioHelper.getDataFromApi(endPoint: 'categories', lang: 'en');
      categoryModel = CategoryModel.fromJson(response.data);
      listOfCategoryData.value = categoryModel!.firstDataElement.data;
      CacheHelper.sharedPreferences!
          .setString('category', jsonEncode(response.data));
    } else {
      var categoryDataFromCache =
          CacheHelper.sharedPreferences!.getString('category');
      categoryModel =
          CategoryModel.fromJson(jsonDecode(categoryDataFromCache!));
      listOfCategoryData.value = categoryModel!.firstDataElement.data;
      print(categoryDataFromCache);
    }
  }

  HomeModelData? homeModelData;
  var bannerList = <Banners>[].obs;
  var productList = <Products>[].obs;
  void getAllHomeDataFromApi() async {
    if (await InternetConnectionChecker().hasConnection) {
      var response =
          await DioHelper.getDataFromApi(endPoint: 'home', lang: 'en');

      homeModelData = HomeModelData.fromJson(response.data);
      bannerList.value = homeModelData!.bannerModelData.bannersList;
      productList.value = homeModelData!.bannerModelData.productsList;
      CacheHelper.sharedPreferences!
          .setString('data', jsonEncode(response.data));
      var dataFromCache =
          jsonDecode(CacheHelper.sharedPreferences!.getString('data')!);
    } else {
      print(jsonDecode(CacheHelper.sharedPreferences!.getString('data')!));
      homeModelData = HomeModelData.fromJson(
          jsonDecode(CacheHelper.sharedPreferences!.getString('data')!));
      bannerList.value = homeModelData!.bannerModelData.bannersList;
      productList.value = homeModelData!.bannerModelData.productsList;
    }

    // homeModelData = HomeModelData.fromJson(response.data);
    // HttpClientHandler.getApiData(path: 'home', lang: 'en').then((value) async {
    //   if (await InternetConnectionChecker().hasConnection) {
    //     homeModelData = HomeModelData.fromJson(jsonDecode(value.body));
    //     bannerList.value = homeModelData!.bannerModelData.bannersList;
    //     productList.value = homeModelData!.bannerModelData.productsList;
    //     Map<String, dynamic> json = jsonDecode(value.body);
    //     print(json);
    //     CacheHelper.sharedPreferences!.setString('data', jsonEncode(json));
    //   } else {
    //     print(CacheHelper.sharedPreferences!.getString(
    //       'data',
    //     ));
    //     homeModelData = HomeModelData.fromJson(
    //         jsonDecode(CacheHelper.sharedPreferences!.getString('data')!));

    //     bannerList.value = homeModelData!.bannerModelData.bannersList;
    //     productList.value = homeModelData!.bannerModelData.productsList;

    //     // print(bannerList);
    //   }
    // });
  }

  // add product to list of product

  var productListCart = <Products>[].obs;
  addProductToList(Products products) {
    productListCart.add(products);

    print(productListCart.length);
  }
}
