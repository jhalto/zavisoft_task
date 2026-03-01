import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';
import 'package:zavisoft_task/feature/home/controllers/home_controller.dart';
import 'package:zavisoft_task/feature/home/views/expanded_home_view.dart';
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
          body: RefreshIndicator(
            onRefresh: controller.fetchProducts,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  // Collapsible Header
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                  
                    expandedHeight: MediaQuery.of(context).size.height,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top,
                          bottom: MediaQuery.of(context).padding.bottom,
                        ),
                        color: AppColors.whiteColor,

                        child: ExpandedHomeView(),
                      ),
                    ),
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
