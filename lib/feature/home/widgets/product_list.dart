import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  final RxList<dynamic> category;

  const ProductList({super.key, required this.category});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(), 
        itemCount: widget.category.length,
        itemBuilder: (context, index) {
          final product = widget.category[index];

          return ListTile(
            leading: Image.network(product['image'], height: 40),
            title: Text(product['title']),
            subtitle: Text("\$${product['price']}"),
          );
        },
      );
    });
  }

  @override
  bool get wantKeepAlive => true; 
}