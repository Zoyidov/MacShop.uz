import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/tab_box_admin/products/sub_screens/product_add_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/models/product/product_model.dart';
import '../../../providers/products_provider.dart';


class ProductsScreenAdmin extends StatefulWidget {
  const ProductsScreenAdmin({super.key});

  @override
  State<ProductsScreenAdmin> createState() => _ProductsScreenAdminState();
}

class _ProductsScreenAdminState extends State<ProductsScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Products"),
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: context.read<ProductsProvider>().getProducts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
                    children: List.generate(
                      snapshot.data!.length,
                      (index) {
                        ProductModel productModel = snapshot.data![index];
                        return ListTile(
                          leading: Image.file(File(productModel.productImages[0])),
                          onLongPress: () {
                            context.read<ProductsProvider>().deleteProduct(
                                  context: context,
                                  productId: productModel.productId,
                                );
                          },
                          title: Text(productModel.productName),
                          subtitle: Text(productModel.description),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(child: Text("No Product Yet!"));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
