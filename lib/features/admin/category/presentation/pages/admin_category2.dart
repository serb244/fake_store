// import 'package:fake_store/core/blocs/language/language_bloc.dart';
// import 'package:fake_store/core/data/models/category/category_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../../core/blocs/app_settings/app_settings_bloc.dart';
// import '../../../../../core/blocs/category/category_bloc.dart';

// import '../../../../../core/data/models/category/category_description.dart';
// import '../../../../../core/di/injector.dart';
// import '../../../../../core/presentation/widgets/dropdown_with_search.dart';
// import 'admin_category_description.dart';

// class AdminCategory extends StatelessWidget {
//   final String categoryId;

//   const AdminCategory({required this.categoryId, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final int id = int.parse(categoryId);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryId == "0" ? "Add Category" : "Category: $categoryId"),
//         actions: const [],
//       ),
//       body: CategoryForm(
//         id: id,
//       ),
//     );
//   }
// }

// class CategoryForm extends StatefulWidget {
//   final int id;

//   const CategoryForm({required this.id, super.key});

//   @override
//   CategoryFormState createState() => CategoryFormState();
// }

// class CategoryFormState extends State<CategoryForm> {
//   bool isActive = true;
//   int? parentCategoryId;
//   bool isAutoMode = true;

//   void _onParentCategorySelected(int? categoryId) {
//     parentCategoryId = categoryId;
//   }

//   void _onTapDelete(int categoryId) {
//     injector<CategoryBloc>().add(CategoryDeleteEvent(categoryId: categoryId));
//     context.pop();
//   }

//   void _onTapSave(CategoryModel category) {
//     injector<CategoryBloc>().add(CategorySaveEvent(category));
//     // context.pop();
//   }

//   void _onCategoryChanged(CategoryModel category) {
//     print("Category changed: $category");
//   }

//   @override
//   Widget build(BuildContext context) {
//     injector<CategoryBloc>().add(CategoryGetByIdEvent(categoryId: widget.id, isNedAllCategories: true));
//     return BlocConsumer<CategoryBloc, CategoryState>(
//       listener: (context, state) {
//         if (state is CategoryErrorState) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
//           // injector<CategoryBloc>().add(const CategoryInitEvent());
//           injector<CategoryBloc>().add(CategoryGetByIdEvent(categoryId: widget.id));
//         }
//       },
//       builder: (context, state) {
//         if (state is CategoryLoadingState) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         // if (state is CategoryErrorState) {
//         //   return Center(child: Text(state.error));
//         // }
//         if (state is CategorySuccessState) {
//           CategoryModel currentCategory = state.category;
//           // для widget.id = 0 добавляем список дескрипшенов категории
//           if (widget.id == 0) {
//             currentCategory = CategoryModel.initByLanguageList(languageList: injector<LanguageBloc>().allLanguages);
//           }
//           final int languageQnt = injector<LanguageBloc>().allLanguages.length;
//           final int currentLanguageId = injector<AppSettingsBloc>().appSettings.languageId;
//           // добавляем все категории к выпадающему списку (кроме вібранной категории )
//           const String nullCategoryString = "Корневая категория";
//           final Map<int, String> optionsReversed = {};
//           for (var element in state.allCategories) {
//             if (element.id == currentCategory.id) continue;
//             optionsReversed[element.id] = element.description.firstWhere((element) => element.languageId == currentLanguageId).name;
//           }
//           optionsReversed[0] = nullCategoryString;
//           return LayoutBuilder(
//             builder: (context, constraints) {
//               const double menuHeight = 120;
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(
//                     height: menuHeight,
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Switch(
//                                 value: isAutoMode,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     isAutoMode = value;
//                                   });
//                                 }),
//                             IconButton(
//                               onPressed: () => _onTapSave(currentCategory),
//                               icon: const Icon(Icons.save),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.refresh),
//                             ),
//                             currentCategory.id != 0
//                                 ? IconButton(
//                               onPressed: () => _onTapDelete(currentCategory.id),
//                               icon: const Icon(
//                                 Icons.delete_forever,
//                               ),
//                             )
//                                 : const SizedBox.shrink(),
//                           ],
//                         ),
//                         Row(children: [
//                           Row(
//                             children: [
//                               const Text("is Active:"),
//                               Switch(
//                                   value: currentCategory.status,
//                                   onChanged: (value) {
//                                     print ("value: $value");
//                                     currentCategory = currentCategory.copyWith(status: value);
//                                     print("currentCategory: $currentCategory");
//                                     setState(() {});
//                                   })
//                             ],
//                           ),
//                           Expanded(
//                             child: DropdownWithSearchWidget(
//                               options: optionsReversed,
//                               labelText: 'Выберите категорию',
//                               initialValue: parentCategoryId ?? 0,
//                               onSelected: _onParentCategorySelected,
//                             ),
//                           ),
//                         ]),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: DefaultTabController(
//                       key: Key(currentCategory.id.toString()),
//                       length: languageQnt,
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 50,
//                             child: TabBar(
//                               tabs: List.generate(languageQnt, (index) => Tab(text: injector<LanguageBloc>().allLanguages[index].name)),
//                             ),
//                           ),
//                           Expanded(
//                             child: TabBarView(
//                               children: List.generate(languageQnt, (index) {
//                                 /// проходимся по всем язікам
//                                 /// если у данной категории есть описание для данного языка - отображаем его
//                                 /// если нет, то отображаем CategoryDescription.init().copyWith(languageId: languageId, categoryId:currentCategory.id, name: "")
//                                 final int languageId = injector<LanguageBloc>().allLanguages[index].id;
//                                 if (currentCategory.description.any((element) => element.languageId == languageId)) {
//                                   return AdminCategoryDescription(
//                                     categoryDescription: currentCategory.description.firstWhere((element) => element.languageId == languageId),
//                                   );
//                                 } else {
//                                   return AdminCategoryDescription(
//                                     categoryDescription:
//                                     CategoryDescription.init().copyWith(languageId: languageId, categoryId: currentCategory.id, name: ""),
//                                   );
//                                 }
//                               }),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }
