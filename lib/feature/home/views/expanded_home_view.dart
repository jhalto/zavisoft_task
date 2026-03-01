import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';
import 'package:zavisoft_task/core/const/app_text_style.dart';
import 'package:zavisoft_task/feature/home/controllers/home_controller.dart';

class ExpandedHomeView extends StatelessWidget {
  ExpandedHomeView({super.key});
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
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
                    children: [
                      Expanded(
                        child: Text(
                          "Safe Payment",
                          style: AppTextStyle.bodyMediumWhite,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Fast Delivery",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodyMediumWhite,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Free Return",
                          textAlign: TextAlign.end,
                          style: AppTextStyle.bodyMediumWhite,
                        ),
                      ),
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
                          height: 170,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.jewelery.length,
                            itemBuilder: (context, index) {
                              final product = controller.jewelery[index];

                              return Container(
                                width: 140,
                                margin: const EdgeInsets.only(right: 12),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.shade100,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: CachedNetworkImage(
                                        imageUrl: product.image,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      product.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "\$${product.price}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
