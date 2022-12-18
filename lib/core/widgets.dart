import 'package:flutter/material.dart';
import 'package:flutter_demo_app_task/core/cache_manager.dart';
import 'package:flutter_demo_app_task/core/style.dart';
import 'package:flutter_demo_app_task/core/view_model/app_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget customTextFormField() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, 1)),
          ],
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: TextFormField(
          onChanged: (value) {
            print(value);
          },
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.all(8.0).copyWith(top: 12.0, left: 10.0),
                child: const FaIcon(FontAwesomeIcons.magnifyingGlass),
              ),
              hintText: 'Search in a thousands of products..',
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              )),
        ),
      ),
    );

Widget customAddressContainer(
    {required double height,
    required double width,
    required IconData faIcon,
    required String addresstype,
    required String country,
    required String street}) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: .5),
        borderRadius: const BorderRadius.all(Radius.circular(12.0))),
    height: 70,
    // width: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(
                border: Border.all(width: .9, color: Colors.blueGrey)),
            child: FaIcon(
              faIcon,
              color: Colors.blueGrey,
              size: 35.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              Text(
                addresstype,
                style: AppStyle.boldTextStyle.copyWith(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                country,
                style: AppStyle.boldTextStyle.copyWith(fontSize: 12.0),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                street,
                style: AppStyle.boldTextStyle.copyWith(fontSize: 12.0),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget customListViewCategoryBuilder(
  double height,
) {
  var c = Get.find<AppController>();
  return SizedBox(
    height: 120,
    child: ListView.separated(
      itemBuilder: (context, index) => Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: SizedBox(
              height: 80.0,
              width: 80,
              child: Obx(() => cacheNetworkImageCustom(
                  image: c.listOfCategoryData[index].image, icon: Icons.error)),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Obx(() => Text(
                c.listOfCategoryData[index].name,
                style: AppStyle.boldTextStyle.copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 15.0,
      ),
      itemCount: c.listOfCategoryData.length,
      scrollDirection: Axis.horizontal,
    ),
  );
}

// CachedNetworkImage customNetwrokImage(e, IconData icon) {
//   return CachedNetworkImage(
//     imageUrl: (e.image ?? CacheHelper.sharedPreferences!.getString('image')!),
//     placeholder: (context, url) => const CircularProgressIndicator(),
//     errorWidget: (context, url, error) => Icon(icon),
//   );
// }
