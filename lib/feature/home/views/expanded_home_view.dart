import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';
import 'package:zavisoft_task/core/const/app_text_style.dart';
import 'package:zavisoft_task/feature/home/controllers/home_controller.dart';

class ExpandedHomeView extends StatelessWidget {
  ExpandedHomeView({super.key});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 2),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: .center,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: const TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.photo_camera_outlined,
                        size: 28,
                        color: AppColors.borderColor,
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 2.0,
                          top: 2,
                          bottom: 2,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: AppColors.primaryColor,
                          ),

                          alignment: .center,
                          child: Text(
                            "Search",
                            style: AppTextStyle.bodySlideBold.copyWith(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff464646),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("Safe Payment", style: AppTextStyle.bodyMediumWhite),
                      Text(
                        "Fast Delivery",
                        style: AppTextStyle.bodyMediumWhite,
                      ),
                      Text("Free Return", style: AppTextStyle.bodyMediumWhite),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: AppColors.whiteColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Flash Sale"),
                                SizedBox(width: 30),
                                Text("01:47:01"),
                              ],
                            ),
                            Text("Shop More"),
                          ],
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.jewelery.length,
                            itemBuilder: (context, index) {
                              final product = controller.jewelery[index];
                              return Container(
                                width: 200,
                                height: 200,
                                child: Column(
                                  mainAxisSize: .min,
                                  children: [
                                    CachedNetworkImage(imageUrl: product.image,height: 200,width: 200,fit: BoxFit.contain,),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
