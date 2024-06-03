import 'package:fake_store/core/blocs/language/language_bloc.dart';
import 'package:fake_store/core/data/models/category/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/blocs/app_settings/app_settings_bloc.dart';
import '../../../../../core/blocs/category/category_bloc.dart';
import '../../../../../core/data/models/category/category_description.dart';
import '../../../../../core/di/injector.dart';
import '../../../../../core/presentation/widgets/dropdown_with_search.dart';
import '../../../../../core/utils/app_init.dart';
import 'admin_category_description.dart';

class AdminCategory extends StatelessWidget {
  final String categoryId;

  const AdminCategory({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    appInit();
    final int id = int.parse(categoryId);
    return Scaffold(
      appBar: AppBar(
        title:
            Text(categoryId == "0" ? "Add Category" : "Category: $categoryId"),
        actions: const [],
      ),
      body: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is CategoryErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error.toString())));
          }
        },
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategoryErrorState) {
            return Row(
              children: [
                Center(child: Text(state.error)),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    appInit();
                  },
                )
              ],
            );
          }
          if (state is CategorySuccessState) {
            CategoryModel currentCategory = CategoryModel.initByLanguageList(
                languageList: injector<LanguageBloc>().allLanguages);
            // для widget.id = 0 добавляем список дескрипшенов категории
            if (id != 0) {
              currentCategory =
                  state.allCategories.firstWhere((cat) => cat.id == id);
            }
            return CategoryForm(
              currentCategory: currentCategory,
              allCategories: state.allCategories,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CategoryForm extends StatefulWidget {
  final CategoryModel currentCategory;
  final List<CategoryModel> allCategories;
  const CategoryForm(
      {required this.currentCategory, required this.allCategories, super.key});
  @override
  CategoryFormState createState() => CategoryFormState();
}

class CategoryFormState extends State<CategoryForm> {
  final List<GlobalKey<AdminCategoryDescriptionState>> _descriptionKeys = [];
  bool isActive = true;
  bool isAutoMode = true;
  late CategoryModel currentCategory;
  void _onParentCategorySelected(int? categoryId) {
    currentCategory = currentCategory.copyWith(parentCategoryId: categoryId);
  }

  void _onTapSwitchAutoMode(value) {
    setState(() {
      isAutoMode = value;
    });
  }

  @override
  initState() {
    super.initState();
    currentCategory = widget.currentCategory;
    for (var i = 0; i < injector<LanguageBloc>().allLanguages.length; i++) {
      _descriptionKeys.add(GlobalKey<AdminCategoryDescriptionState>());
    }
  }

  void _onTapDelete(int categoryId) {
    context.pop();
    injector<CategoryBloc>().add(CategoryDeleteEvent(categoryId: categoryId));
  }

  void _onTapSave(CategoryModel category) {
    injector<CategoryBloc>().add(CategorySaveEvent(category));
    // context.pop();
  }

  void _onTapCategoryResetBtn() {
    currentCategory = widget.currentCategory;
    for (var key in _descriptionKeys) {
      key.currentState?.resetData();
    }
    setState(() {});
  }

  void _onCategoryChanged(CategoryModel category) {
    print("Category changed: $category");
  }

  void _onCategoryActiveChanged(value) {
    currentCategory = currentCategory.copyWith(status: value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // CategoryModel  currentCategory = widget.currentCategory;
    print("currentCategory.status: ${currentCategory.status}");
    final int languageQnt = injector<LanguageBloc>().allLanguages.length;
    final int currentLanguageId =
        injector<AppSettingsBloc>().appSettings.languageId;
    // добавляем все категории к выпадающему списку (кроме вібранной категории )
    const String nullCategoryString = "Корневая категория";
    final Map<int, String> optionsReversed = {};
    for (var element in widget.allCategories) {
      if (element.id == currentCategory.id) continue;
      optionsReversed[element.id] = element.description
          .firstWhere((element) => element.languageId == currentLanguageId)
          .name;
    }
    optionsReversed[0] = nullCategoryString;
    return LayoutBuilder(
      builder: (context, constraints) {
        const double menuHeight = 120;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: menuHeight,
              child: Column(
                children: [
                  Row(
                    children: [
                      Switch(
                          value: isAutoMode, onChanged: _onTapSwitchAutoMode),
                      IconButton(
                        onPressed: () => _onTapSave(currentCategory),
                        icon: const Icon(Icons.save),
                      ),
                      IconButton(
                        onPressed: _onTapCategoryResetBtn,
                        icon: const Icon(Icons.refresh),
                      ),
                      currentCategory.id != 0
                          ? IconButton(
                              onPressed: () => _onTapDelete(currentCategory.id),
                              icon: const Icon(
                                Icons.delete_forever,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  Row(children: [
                    Row(
                      children: [
                        Text("is Active: ${currentCategory.status}"),
                        Switch(
                            value: currentCategory.status,
                            onChanged: _onCategoryActiveChanged),
                      ],
                    ),
                    Expanded(
                      child: DropdownWithSearchWidget(
                        options: optionsReversed,
                        labelText: 'Выберите категорию',
                        initialValue: currentCategory.parentCategoryId ?? 0,
                        onSelected: _onParentCategorySelected,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                key: Key(currentCategory.id.toString()),
                length: languageQnt,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TabBar(
                        tabs: List.generate(
                            languageQnt,
                            (index) => Tab(
                                  child: Row(
                                    children: [
                                      Text(injector<LanguageBloc>()
                                          .allLanguages[index]
                                          .name),
                                      IconButton(
                                          onPressed: () => _descriptionKeys[index].currentState?.resetData(),
                                          icon: const Icon(Icons.refresh)),
                                    ],
                                  ),
                                )),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        key: Key(currentCategory.id.toString()),
                        children: List.generate(languageQnt, (index) {
                          /// проходимся по всем язікам
                          /// если у данной категории есть описание для данного языка - отображаем его
                          /// если нет, то отображаем CategoryDescription.init().copyWith(languageId: languageId, categoryId:currentCategory.id, name: "")
                          final int languageId =
                              injector<LanguageBloc>().allLanguages[index].id;
                          final bool isCategoryHaveDescription =
                              currentCategory.description.any((element) =>
                                  element.languageId == languageId);
                          return AdminCategoryDescription(
                            key: _descriptionKeys[index],
                            categoryDescription: isCategoryHaveDescription
                                ? currentCategory.description.firstWhere(
                                    (element) =>
                                        element.languageId == languageId)
                                : CategoryDescription.init().copyWith(
                                    languageId: languageId,
                                    categoryId: currentCategory.id,
                                    name: ""),
                            isAutoMode: isAutoMode,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
