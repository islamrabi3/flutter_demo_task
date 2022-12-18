import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo_app_task/core/cache_manager.dart';
import 'package:flutter_demo_app_task/core/colors.dart';
import 'package:flutter_demo_app_task/core/shared/cache_helper.dart';
import 'package:flutter_demo_app_task/core/style.dart';
import 'package:flutter_demo_app_task/core/view_model/app_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../core/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var controller = Get.find<AppController>();

    return Obx(() => controller.bannerList.isNotEmpty &
            controller.productList.isNotEmpty
        ? RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                const Duration(
                  seconds: 3,
                ),
              ).then((value) {
                controller.getAllHomeDataFromApi();
                controller.getCategoryData();
              });
            },
            child: Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // textform section
                    customTextFormField(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // Addres section
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: customAddressContainer(
                                addresstype: 'Home Addre',
                                country: 'Elhwmida-Giza',
                                faIcon: FontAwesomeIcons.houseUser,
                                street: 'St 30',
                                height: height,
                                width: width),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: customAddressContainer(
                                addresstype: 'Office Addre',
                                country: 'Down-Town',
                                faIcon: FontAwesomeIcons.phone,
                                street: 'St 15',
                                height: height,
                                width: width),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //category Header
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Explore by category',
                            style: AppStyle.boldTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'See All (${controller.listOfCategoryData.length})',
                              style: AppStyle.boldTextStyle.copyWith(),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //category ListView
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customListViewCategoryBuilder(height),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Deals of the day:',
                        style: AppStyle.boldTextStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),

                    SizedBox(
                      height: 135,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                                  height: 125,
                                  width: width * .85,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: .9, color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          child: Stack(
                                            children: [
                                              Obx(() => SizedBox(
                                                    height: 120.0,
                                                    width: width * .3,
                                                    child:
                                                        cacheNetworkImageCustom(
                                                            image: controller
                                                                .productList[
                                                                    index]
                                                                .image,
                                                            icon: Icons.error),
                                                  )),
                                              const CircleAvatar(
                                                radius: 15.0,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 5,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.black87,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        controller.addProductToList(
                                                            controller
                                                                .homeModelData!
                                                                .bannerModelData
                                                                .productsList[index]);
                                                      },
                                                      icon: Icon(
                                                        Icons.shopping_cart,
                                                        color: AppColors
                                                            .primaryColor,
                                                      )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(() => Text(
                                                    controller
                                                        .productList[index]
                                                        .name,
                                                    style: AppStyle
                                                        .boldTextStyle
                                                        .copyWith(
                                                            color:
                                                                Colors.black),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  )),
                                              Text(
                                                'Peices 5',
                                                style: AppStyle.regularFont,
                                              ),
                                              // ignore: prefer_const_literals_to_create_immutables
                                              Row(children: const [
                                                FaIcon(FontAwesomeIcons
                                                    .locationDot),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text('15 Minutes')
                                              ]),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Obx(() => Text(controller
                                                        .productList[index]
                                                        .price
                                                        .toString())),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    if (controller
                                                            .productList[index]
                                                            .discount >
                                                        0)
                                                      Obx(
                                                        () => Text(
                                                          controller
                                                              .productList[
                                                                  index]
                                                              .oldPrice
                                                              .toString(),
                                                          style: const TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough),
                                                        ),
                                                      )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 25.0,
                                ),
                            itemCount: controller.productList.length),
                      ),
                    ),
                    // banner Carousel Slider
                    CarouselSlider(
                      items: [
                        for (var e in controller.bannerList)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: cacheNetworkImageCustom(
                                  image: e.image, icon: Icons.error),
                            ),
                          )
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: 120,
                        scrollDirection: Axis.vertical,
                        aspectRatio: 1 / 3,
                        padEnds: true,
                        viewportFraction: 0.9,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          ));
  }
}
