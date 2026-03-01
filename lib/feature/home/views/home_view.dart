import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';
import 'package:zavisoft_task/feature/home/controllers/home_controller.dart';
import 'package:zavisoft_task/feature/home/widgets/product_list.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  final tabs = const [
    Tab(text: "Electronics"),
    Tab(text: "Jewelery"),
    Tab(text: "Men"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: controller.fetchProducts,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // Collapsible Header
                SliverAppBar(
                  automaticallyImplyLeading: false,
                   
                  expandedHeight: 100,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    
                    background: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      color: AppColors.primaryColor,
                      alignment: Alignment.center,
                      child: const TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                            borderSide: BorderSide(
                              color: AppColors.borderColor,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),

                            borderSide: BorderSide(
                              color: AppColors.borderColor,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Sticky TabBar
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverTabBarDelegate(TabBar(tabs: tabs)),
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
