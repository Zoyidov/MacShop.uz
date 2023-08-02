import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_screen_homework/ui/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../data/models/category/category_model.dart';
import '../../../../data/models/product/product_model.dart';
import '../../../../providers/category_provider.dart';
import '../../../../providers/products_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/global_textfield.dart';

class ProductAddScreen extends StatefulWidget {
  ProductAddScreen({Key? key, this.productModel}) : super(key: key);

  final ProductModel? productModel;

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  ImagePicker picker = ImagePicker();
  String imagePath = defaultImageConstant;
  String currency = "";

  List<String> currencies = [
    "UZS",
    "RUB",
    "USD",
  ];

  String selectedCurrency = "UZS";
  String selectedCategoryId = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<ProductsProvider>(context, listen: false).clearTexts();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
              widget.productModel == null ? "Product Add" : "Product Update"),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<CategoryProvider>(context, listen: false)
                  .clearTexts();
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                StreamBuilder<List<CategoryModel>>(
                  stream: context.read<CategoryProvider>().getCategories(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CategoryModel>> snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isNotEmpty
                          ? SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            snapshot.data!.length,
                                (index) {
                              CategoryModel categoryModel =
                              snapshot.data![index];
                              return ZoomTapAnimation(
                                onTap: () {
                                  setState(() {
                                    selectedCategoryId =
                                        categoryModel.categoryId;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(16),
                                    color: selectedCategoryId ==
                                        categoryModel.categoryId
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  height: 100,
                                  margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                                  padding: const EdgeInsets.all(20),
                                  child: Center(
                                    child: Text(
                                      categoryModel.categoryName,
                                      style: TextStyle(
                                        color: selectedCategoryId ==
                                            categoryModel.categoryId
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                          : const Center(child: Text("Empty!"));
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                const SizedBox(height: 24),
                ZoomTapAnimation(
                  onTap: () {
                    showBottomSheetDialog();
                  },
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                          8),
                    ),
                    child: imagePath == defaultImageConstant
                        ? Text(
                      imagePath,
                      style: const TextStyle(color: Colors.black),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    )
                        : Image.file(File(imagePath)),
                  ),
                ),
                const SizedBox(height: 24),
                GlobalTextField(
                  hintText: "Product Name",
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller:
                      context.read<ProductsProvider>().productNameController,
                  prefixIcon: Icons.polyline_rounded,
                  caption: '',
                ),
                const SizedBox(height: 24),
                GlobalTextField(
                  hintText: "Description",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller:
                      context.read<ProductsProvider>().productDescController,
                  prefixIcon: Icons.drive_file_rename_outline,
                  caption: '',
                ),
                const SizedBox(height: 24),
                GlobalTextField(
                  hintText: "Product Count",
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller:
                      context.read<ProductsProvider>().productCountController,
                  prefixIcon: Icons.countertops_outlined,
                  caption: '',
                ),
                const SizedBox(height: 24),
                GlobalTextField(
                  hintText: "Product Price",
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller:
                      context.read<ProductsProvider>().productPriceController,
                  prefixIcon: Icons.price_check,
                  caption: '',
                ),
                const SizedBox(height: 34),
                DropdownButton(
                  value: selectedCurrency,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: currencies.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCurrency = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(widget.productModel == null ? Icons.done : Icons.update),
          onPressed: () {
            if (imagePath != defaultImageConstant &&
                selectedCategoryId.isNotEmpty) {
              context.read<ProductsProvider>().addProduct(
                    context: context,
                    imageUrls: [imagePath],
                    categoryId: selectedCategoryId,
                    productCurrency: selectedCurrency,
                  );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 1000),
                  backgroundColor: Colors.black,
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 50,
                  ),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    "Data is not full",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Get it from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Get it from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      setState(() {
        imagePath = xFile.path;
      });
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      setState(() {
        imagePath = xFile.path;
      });
    }
  }
}
