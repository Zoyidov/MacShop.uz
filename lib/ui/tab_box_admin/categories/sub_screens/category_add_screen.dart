import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../data/models/category/category_model.dart';
import '../../../../providers/category_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/global_textfield.dart';

class CategoryAddScreen extends StatefulWidget {
  CategoryAddScreen({super.key, this.categoryModel});

  CategoryModel? categoryModel;

  @override
  State<CategoryAddScreen> createState() => _CategoryAddScreenState();
}

class _CategoryAddScreenState extends State<CategoryAddScreen> {
  ImagePicker picker = ImagePicker();
  String imagePath = defaultImageConstant;

  @override
  void initState() {
    if (widget.categoryModel != null) {
      context.read<CategoryProvider>().setInitialValues(widget.categoryModel!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<CategoryProvider>(context, listen: false).clearTexts();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(widget.categoryModel == null
              ? "Category Add"
              : "Category Update"),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  showBottomSheetDialog();
                },
                child: Container(
                  height: 300,
                  width: 512,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
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
                hintText: "Name",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller:
                context.read<CategoryProvider>().categoryNameController,
                prefixIcon: Icons.person,
                caption: '',
              ),
              const SizedBox(height: 24),
              GlobalTextField(
                hintText: "Description",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller:
                context.read<CategoryProvider>().categoryDescController,
                prefixIcon: Icons.description,
                caption: '',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(widget.categoryModel == null ? Icons.done : Icons.update),
          onPressed: () {
            if (imagePath != defaultImageConstant) {
              if (widget.categoryModel == null) {
                context.read<CategoryProvider>().addCategory(
                  context: context,
                  imageUrl: imagePath,
                );
              } else {
                context.read<CategoryProvider>().updateCategory(
                    context: context,
                    imagePath: imagePath,
                    currentCategory: widget.categoryModel!);
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 500),
                  backgroundColor: Colors.black,
                  margin: EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: 20,
                  ),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    "Image not added!",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
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
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
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
                title: const Text("Select from Gallery"),
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
