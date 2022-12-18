import 'package:flutter/material.dart';
import 'package:flutter_demo_app_task/core/colors.dart';
import 'package:flutter_demo_app_task/core/style.dart';
import 'package:flutter_demo_app_task/core/view_model/app_controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  var controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cart',
              style: AppStyle.boldTextStyle
                  .copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ),
          if (controller.productListCart.isEmpty)
            Center(
              child: Text(
                'No Product in Your Cart',
                style: AppStyle.boldTextStyle,
              ),
            ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: const Icon(Icons.delete),
                  onDismissed: ((direction) {
                    controller.productListCart.removeAt(index);
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(
                              controller.productListCart[index].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                controller.productListCart[index].name,
                                style: AppStyle.boldTextStyle,
                                maxLines: 1,
                              ),
                              Obx(() => Text(
                                    'LE ${controller.productListCart[index].price * controller.piecesCount.value} Total price',
                                    style: AppStyle.regularFont,
                                  )),
                              Obx(() => Text(
                                    'LE ${controller.productListCart[index].price}',
                                    style: AppStyle.regularFont,
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.decreasePieceCount();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                    15.0,
                                  )),
                                  backgroundColor: AppColors.elevatedBtnColor,
                                ),
                                child: const Icon(Icons.minimize),
                              ),
                              Obx(() => Text(
                                    '${controller.piecesCount}',
                                    style: AppStyle.boldTextStyle
                                        .copyWith(color: Colors.black),
                                  )),
                              ElevatedButton(
                                onPressed: () {
                                  controller.increasecrPieceCount();
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      15.0,
                                    )),
                                    backgroundColor:
                                        AppColors.elevatedBtnColor),
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: controller.productListCart.length)
        ],
      ),
    );
  }
}
