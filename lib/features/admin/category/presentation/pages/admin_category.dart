import 'package:fake_store/core/utils/extensions/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/models/category_description.dart';
import '../../../../../core/data/models/category_model.dart';

class AdminCategory extends StatelessWidget {
  final String categoryId;

  const AdminCategory({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryId == "0" ? "Add Category" : "Category: $categoryId"),
      ),
      body: categoryId == "0" ? const CategoryForm() : Text("Category: $categoryId"),
    );
  }
}

class CategoryForm extends StatefulWidget {
  // final void Function(CategoryModel) onSubmit;

  // AddCategoryForm({required this.onSubmit});
  const CategoryForm({super.key});

  @override
  CategoryFormState createState() => CategoryFormState();
}

class CategoryFormState extends State<CategoryForm> {
  late TextEditingController _nameController;
  late TextEditingController _slugController;
  late TextEditingController _descriptionController;
  late TextEditingController _metaTitleController;
  late TextEditingController _metaDescriptionController;
  late TextEditingController _metaKeywordController;
  late TextEditingController _seoKeywordController;
  late TextEditingController _seoH1Controller;
  late TextEditingController _seoH2Controller;
  late TextEditingController _seoH3Controller;

  // Add controllers for other fields as needed

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _slugController = TextEditingController();
    _descriptionController = TextEditingController();
    _metaTitleController = TextEditingController();
    _metaDescriptionController = TextEditingController();
    _metaKeywordController = TextEditingController();
    _seoKeywordController = TextEditingController();
    _seoH1Controller = TextEditingController();
    _seoH2Controller = TextEditingController();
    _seoH3Controller = TextEditingController();
    // Initialize controllers for other fields as needed
  }

  @override
  void dispose() {
    _nameController.dispose();
    _slugController.dispose();
    _descriptionController.dispose();
    _metaTitleController.dispose();
    _metaDescriptionController.dispose();
    _metaKeywordController.dispose();
    _seoKeywordController.dispose();
    _seoH1Controller.dispose();
    _seoH2Controller.dispose();
    _seoH3Controller.dispose();
    // Dispose controllers for other fields as needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                _slugController.text = value.createSlug();
              },
            ),
            TextField(
              controller: _slugController,
              decoration: const InputDecoration(labelText: 'Slug'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _metaTitleController,
              decoration: const InputDecoration(labelText: 'Meta Title'),
            ),
            TextField(
              controller: _metaDescriptionController,
              decoration: const InputDecoration(labelText: 'Meta Description'),
            ),
            TextField(
              controller: _metaKeywordController,
              decoration: const InputDecoration(labelText: 'Meta Keyword'),
            ),
            TextField(
              controller: _seoKeywordController,
              decoration: const InputDecoration(labelText: 'SEO Keyword'),
            ),
            TextField(
              controller: _seoH1Controller,
              decoration: const InputDecoration(labelText: 'SEO H1'),
            ),
            TextField(
              controller: _seoH2Controller,
              decoration: const InputDecoration(labelText: 'SEO H2'),
            ),
            TextField(
              controller: _seoH3Controller,
              decoration: const InputDecoration(labelText: 'SEO H3'),
            ),
            ElevatedButton(
              onPressed: () {
                final category = CategoryModel(
                  id: 0,
                  parentCategoryId: null,
                  top: false,
                  column: 0,
                  sortOrder: 0,
                  status: true,
                  dateAdded: DateTime.now(),
                  dateModified: DateTime.now(),
                  languageId: 1,
                  description: CategoryDescription(
                    categoryId: 0,
                    languageId: 1,
                    name: _nameController.text,
                    slug: _slugController.text,
                    description: _descriptionController.text,
                    metaTitle: _metaTitleController.text,
                    metaDescription: _metaDescriptionController.text,
                    metaKeyword: _metaKeywordController.text,
                    seoKeyword: _seoKeywordController.text,
                    seoH1: _seoH1Controller.text,
                    seoH2: _seoH2Controller.text,
                    seoH3: _seoH3Controller.text,
                  ),
                );
                // widget.onSubmit(category);
                print(category);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
