import 'package:fake_store/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/blocs/category/category_bloc.dart';
import '../../../../../core/data/models/category/category_model.dart';
import '../../../../../core/routes/route_constants.dart';

class AppDrawerCategoryList extends StatelessWidget {
  const AppDrawerCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          const Text('Categories'),
          isAdmin
              ? IconButton(
                  onPressed: () => context.pushNamed(RouteConstants.adminCategoryName, pathParameters: {'categoryId': '0'}),
                  icon: const Icon(Icons.add),
                )
              : const SizedBox.shrink()
        ],
      ),
      children: [
        BlocConsumer<CategoryBloc, CategoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CategoryLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoryErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else if (state is CategorySuccessState) {
                return AppDrawerCategoryListWidget(categoryModelList: state.allCategories, parentId: null);
              } else {
                return Container();
              }
            })
      ],
    );
  }
}

class AppDrawerCategoryListWidget extends StatelessWidget {
  final int? parentId;
  final List<CategoryModel> categoryModelList;

  const AppDrawerCategoryListWidget({required this.categoryModelList, required this.parentId, super.key});

  @override
  Widget build(BuildContext context) {
    // на каждой итерации из общего списка categoryModelList получаем currentCategories на основе parentId
    final List<CategoryModel> currentCategories =
    categoryModelList.where((category) => category.parentCategoryId == parentId).toList();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: currentCategories.length,
        physics: const NeverScrollableScrollPhysics(),
        // itemExtent: 75,
        itemBuilder: (context, index) {
          // для каждого элемента в currentCategories узнаем есть ли у него дочерние элементы
          final bool isHasChild = categoryModelList.any((category) => category.parentCategoryId == currentCategories[index].id);
          return ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      print("onTap");
                      // Обработчик нажатия на текст
                    },
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      currentCategories[index].description[1].name,
                      style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                isAdmin
                    ? Row(
                        children: [
                          InkWell(
                            onTap: () {
                              injector<CategoryBloc>().add(CategoryDeleteEvent(categoryId: categoryModelList[index].id));
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.pushNamed(RouteConstants.adminCategoryName,
                                  pathParameters: {'categoryId': currentCategories[index].id.toString()});
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
            trailing: isHasChild  ? null : const SizedBox(),
            children: <Widget>[
              AppDrawerCategoryListWidget(
                categoryModelList: categoryModelList,
                parentId: currentCategories[index].id,
              ),
            ],
          );
        });
  }
}
