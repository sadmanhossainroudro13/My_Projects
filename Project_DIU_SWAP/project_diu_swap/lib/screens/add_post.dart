import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_diu_swap/widgets/bold_text.dart';
import 'package:project_diu_swap/widgets/custom_drop_down.dart';
import 'package:project_diu_swap/widgets/custom_textfield.dart';
import 'dart:io';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? selectedCategory;

  List<XFile> images = [];

  final ImagePicker picker = ImagePicker();

  // Pick Image Function
  Future<void> pickImages() async {
    final selectedImage = await picker.pickMultiImage();
    if (selectedImage != null && selectedImage.isNotEmpty) {
      setState(() {
        images.addAll(selectedImage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Post",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldText(str: 'Upload Photos'),

              SizedBox(height: 10),

              SizedBox(height: 110,),

              BoldText(str: "Title"),

              CustomTexField(
                controller: _titleController,
                hint: "Enter item title",
              ),

              BoldText(str: "Price"),

              CustomTexField(controller: _priceController, hint: "Enter price"),

              BoldText(str: "Category"),

              CustomDropdown(
                selectedCategory: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),

              BoldText(str: "Location"),

              CustomTexField(
                controller: _locationController,
                hint: "YKSG hall-1, Daffodil International University",
                maxLines: 1,
              ),

              BoldText(str: "Description"),

              CustomTexField(
                controller: _descriptionController,
                hint: "Describe your item...",
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
