import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo_app_task/core/colors.dart';
import 'package:flutter_demo_app_task/core/view_model/app_controller.dart';
import 'package:flutter_demo_app_task/view/cart_screen.dart';
import 'package:flutter_demo_app_task/view/favorite_screen.dart';
import 'package:flutter_demo_app_task/view/home_page.dart';
import 'package:flutter_demo_app_task/view/news_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../core/utils.dart';
import 'add_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(AppController());

  PersistentTabController persistentTabController = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 19.0,
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                topRight: Radius.circular(50.0),
              )),
          height: kToolbarHeight * .8,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const FaIcon(FontAwesomeIcons.locationDot),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  'Address of ...',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight * .98,
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: Obx(
                () => BottomNavigationBar(
                  showUnselectedLabels: true,
                  onTap: (index) => controller.toggleTweenScreens(index),

                  unselectedItemColor: AppColors.unselectedItem,
                  selectedItemColor: AppColors.iconColor,
                  currentIndex: controller.currentIndex.value,
                  // ignore: prefer_const_literals_to_create_immutables
                  items: bottomNavItems,
                ),
              )),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            backgroundColor: AppColors.iconColor,
            hoverElevation: 10,
            splashColor: Colors.grey,
            tooltip: 'Shop Now ',
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('LE 91'),
                  const FaIcon(
                    FontAwesomeIcons.cartShopping,
                    size: 15.0,
                  )
                ],
              ),
            ),
            onPressed: () => Get.to(const EmptyScreen())),
      ),
    );
  }
}
