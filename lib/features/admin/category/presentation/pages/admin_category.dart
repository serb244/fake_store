import 'package:fake_store/core/utils/extensions/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/data/models/category/category_description.dart';
import '../../../../../core/data/models/category/category_model.dart';

import '../../../../../core/di/injector.dart';
import '../manager/admin_category_bloc.dart';

class AdminCategory extends StatelessWidget {
  final String categoryId;

  const AdminCategory({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    injector<AdminCategoryBloc>().add(AdminCategoryInitEvent(categoryId: int.parse(categoryId)));
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryId == "0" ? "Add Category" : "Category: $categoryId"),
        actions: const [],
      ),
      body: const CategoryForm(),
    );
  }
}

class CategoryForm extends StatefulWidget {
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
  bool isActive = true;
  int? parentCategoryId;
  bool isAutoMode = true;

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

  void _handleCategorySelection(int? categoryId, int index) {
    parentCategoryId = categoryId;
    // Обновление списка дочерних категорий для следующего уровня
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCategoryBloc, AdminCategoryState>(
      listener: (context, state) {
        if (state is AdminCategoryLoadedState) {

          isActive = state.category.status;
          parentCategoryId = state.category.parentCategoryId;
          _nameController.text = state.category.description.name;
          _slugController.text = state.category.description.slug;
          _descriptionController.text = state.category.description.description;
          _metaTitleController.text = state.category.description.metaTitle;
          _metaDescriptionController.text = state.category.description.metaDescription;
          _metaKeywordController.text = state.category.description.metaKeyword;
          _seoKeywordController.text = state.category.description.seoKeyword;
          _seoH1Controller.text = state.category.description.seoH1;
          _seoH2Controller.text = state.category.description.seoH2;
          _seoH3Controller.text = state.category.description.seoH3;
        }
      },
      builder: (context, state) {
        if (state is AdminCategoryLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is AdminCategoryErrorState) {
          return Center(child: Text(state.error));
        }
        if (state is AdminCategoryLoadedState) {
          print("parentCategoryId: $parentCategoryId");
          List<DropdownMenuItem<int?>>? items = state.allCategories
              .map((category) => DropdownMenuItem<int?>(
                    value: category.id,
                    child: Text("${category.id} ${category.description.name}" ),
                  ))
              .toList();
          items.insert(
              0,
              const DropdownMenuItem<int?>(
                value: null,
                child: Text('Корневая категория'),
              ));
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      state.category.id != 0 ? IconButton(
                        onPressed: () => _onTapDelete(state.category.id),
                        icon: const Icon(
                          Icons.delete_forever,
                        ),
                      ) : const SizedBox.shrink(),
                      Switch(
                          value: isAutoMode,
                          onChanged: (value) {
                            setState(() {
                              isAutoMode = value;
                            });
                          }),
                    ],
                  ),
                  Row(children: [
                    const Text("is Active:"),
                    Switch(
                        value: isActive,
                        onChanged: (value) {
                          setState(() {
                            isActive = value;
                          });
                        })
                  ]),
                  DropdownButtonFormField<int?>(
                    value: parentCategoryId,
                    items: items,
                    onChanged: (value) => _handleCategorySelection(value, 0),
                    hint: const Text('Выберите категорию 1'),
                  ),
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
                  ElevatedButton(
                    onPressed: () {
                      final category = CategoryModel(
                        id: 0,
                        parentCategoryId: parentCategoryId,
                        top: false,
                        column: 0,
                        sortOrder: 0,
                        status: true,
                        dateAdded: DateTime.now(),
                        dateModified: DateTime.now(),
                        languageId: 1,
                        description: CategoryDescription(
                          categoryId: 0,
                          categoryDescriptionId: 0,
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
                      injector<AdminCategoryBloc>().add(AdminCategorySaveEvent(category));
                      context.pop();
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  void _onTapDelete(int categoryId) {
    injector<AdminCategoryBloc>().add(AdminCategoryDeleteEvent(categoryId: categoryId));
    context.pop();
  }
}
