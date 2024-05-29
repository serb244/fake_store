import 'package:fake_store/core/utils/extensions/strings.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/models/category/category_description.dart';

class AdminCategoryDescription extends StatefulWidget {
  final CategoryDescription categoryDescription;

  const AdminCategoryDescription({
    required this.categoryDescription,
    super.key,
  });

  @override
  State<AdminCategoryDescription> createState() => _AdminCategoryDescriptionState();
}

class _AdminCategoryDescriptionState extends State<AdminCategoryDescription> with AutomaticKeepAliveClientMixin{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _slugController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _metaTitleController = TextEditingController();
  final TextEditingController _metaDescriptionController = TextEditingController();
  final TextEditingController _metaKeywordController = TextEditingController();
  final TextEditingController _seoKeywordController = TextEditingController();
  final TextEditingController _seoH1Controller = TextEditingController();
  final TextEditingController _seoH2Controller = TextEditingController();
  final TextEditingController _seoH3Controller = TextEditingController();
  bool isAutoMode = true;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.categoryDescription.name;
    _slugController.text = widget.categoryDescription.slug;
    _descriptionController.text = widget.categoryDescription.description;
    _metaTitleController.text = widget.categoryDescription.metaTitle;
    _metaDescriptionController.text = widget.categoryDescription.metaDescription;
    _metaKeywordController.text = widget.categoryDescription.metaKeyword;
    _seoKeywordController.text = widget.categoryDescription.seoKeyword;
    _seoH1Controller.text = widget.categoryDescription.seoH1;
    _seoH2Controller.text = widget.categoryDescription.seoH2;
    _seoH3Controller.text = widget.categoryDescription.seoH3;
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                if (isAutoMode) {
                  _slugController.text = value.createSlug();
                  _descriptionController.text = value;
                  _metaTitleController.text = value;
                  _metaDescriptionController.text = value;
                  _metaKeywordController.text = value;
                  _seoKeywordController.text = value;
                  _seoH1Controller.text = value;
                  _seoH2Controller.text = value;
                  _seoH3Controller.text = value;
                }
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
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
