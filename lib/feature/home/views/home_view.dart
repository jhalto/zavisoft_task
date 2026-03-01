import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';
import 'package:zavisoft_task/core/const/app_text_style.dart';
import 'package:zavisoft_task/feature/home/controllers/home_controller.dart';
import 'package:zavisoft_task/feature/home/widgets/product_list.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabs.length,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 2,
                top: MediaQuery.of(context).padding.top,
              ),
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
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
          ),
          body: RefreshIndicator(
            onRefresh: controller.fetchProducts,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Flash Sale"),
                              SizedBox(width: 30,),
                              Text("01:47:01"),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onTap: () {
                              
                            },
                            child: Ink(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Row(
                                children: [
                                  Text("Shop More"),
                                  Icon(CupertinoIcons.chevron_forward)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (controller.mensClothing.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: controller.mensClothing.length,
                          itemBuilder: (context, index) {
                            final product = controller.mensClothing[index];

                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: product.image,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.title,
                                    style: AppTextStyle.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),

                   SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Flash Sale"),
                              SizedBox(width: 30,),
                              Text("01:47:01"),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onTap: () {
                              
                            },
                            child: Ink(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Row(
                                children: [
                                  Text("Shop More"),
                                  Icon(CupertinoIcons.chevron_forward)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (controller.electronics.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: controller.electronics.length,
                          itemBuilder: (context, index) {
                            final product = controller.electronics[index];

                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                                    child: CachedNetworkImage(
                                      imageUrl: product.image,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.title,
                                    style: AppTextStyle.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                   SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Flash Sale"),
                              SizedBox(width: 30,),
                              Text("01:47:01"),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onTap: () {
                              
                            },
                            child: Ink(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Row(
                                children: [
                                  Text("Shop More"),
                                  Icon(CupertinoIcons.chevron_forward)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (controller.jewelery.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: controller.jewelery.length,
                          itemBuilder: (context, index) {
                            final product = controller.jewelery[index];

                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                                    child: CachedNetworkImage(
                                      imageUrl: product.image,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.title,
                                    style: AppTextStyle.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Flash Sale"),
                              SizedBox(width: 30,),
                              Text("01:47:01"),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onTap: () {
                              
                            },
                            child: Ink(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Row(
                                children: [
                                  Text("Shop More"),
                                  Icon(CupertinoIcons.chevron_forward)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (controller.mensClothing.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: controller.mensClothing.length,
                          itemBuilder: (context, index) {
                            final product = controller.mensClothing[index];

                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: product.image,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.title,
                                    style: AppTextStyle.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),

                   SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Flash Sale"),
                              SizedBox(width: 30,),
                              Text("01:47:01"),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onTap: () {
                              
                            },
                            child: Ink(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Row(
                                children: [
                                  Text("Shop More"),
                                  Icon(CupertinoIcons.chevron_forward)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (controller.electronics.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: controller.electronics.length,
                          itemBuilder: (context, index) {
                            final product = controller.electronics[index];

                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                                    child: CachedNetworkImage(
                                      imageUrl: product.image,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.title,
                                    style: AppTextStyle.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                   SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Flash Sale"),
                              SizedBox(width: 30,),
                              Text("01:47:01"),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onTap: () {
                              
                            },
                            child: Ink(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Row(
                                children: [
                                  Text("Shop More"),
                                  Icon(CupertinoIcons.chevron_forward)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (controller.jewelery.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: controller.jewelery.length,
                          itemBuilder: (context, index) {
                            final product = controller.jewelery[index];

                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                                    child: CachedNetworkImage(
                                      imageUrl: product.image,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.title,
                                    style: AppTextStyle.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Flash Sale"),
                              SizedBox(width: 30,),
                              Text("01:47:01"),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onTap: () {
                              
                            },
                            child: Ink(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Row(
                                children: [
                                  Text("Shop More"),
                                  Icon(CupertinoIcons.chevron_forward)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (controller.mensClothing.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: controller.mensClothing.length,
                          itemBuilder: (context, index) {
                            final product = controller.mensClothing[index];

                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: product.image,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.title,
                                    style: AppTextStyle.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),

                   SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Flash Sale"),
                              SizedBox(width: 30,),
                              Text("01:47:01"),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onTap: () {
                              
                            },
                            child: Ink(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Row(
                                children: [
                                  Text("Shop More"),
                                  Icon(CupertinoIcons.chevron_forward)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (controller.electronics.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: controller.electronics.length,
                          itemBuilder: (context, index) {
                            final product = controller.electronics[index];

                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                                    child: CachedNetworkImage(
                                      imageUrl: product.image,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.title,
                                    style: AppTextStyle.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                   SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),

                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Flash Sale"),
                              SizedBox(width: 30,),
                              Text("01:47:01"),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            onTap: () {
                              
                            },
                            child: Ink(
                              padding: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4))
                              ),
                              child: Row(
                                children: [
                                  Text("Shop More"),
                                  Icon(CupertinoIcons.chevron_forward)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (controller.jewelery.isEmpty) {
                        return const SizedBox(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemCount: controller.jewelery.length,
                          itemBuilder: (context, index) {
                            final product = controller.jewelery[index];

                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                                    child: CachedNetworkImage(
                                      imageUrl: product.image,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.title,
                                    style: AppTextStyle.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                  // Sticky TabBar
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverTabBarDelegate(
                      TabBar(tabs: controller.tabs),
                    ),
                  ),
                ];
              },

              // ONLY ONE VERTICAL SCROLL
              body: TabBarView(
                children: [
                  ProductList(category: controller.electronics),
                  ProductList(category: controller.jewelery),
                  ProductList(category: controller.mensClothing),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}
