
import 'package:fake_store/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/data/models/category/category_model.dart';
import '../../../../../core/routes/route_constants.dart';
import '../manager/app_drawer_category_list_bloc.dart';

class AppDrawerCategoryList extends StatefulWidget {
  final List<CategoryModel> allCategories;
  final int? parentId;
  final bool isAdmin = true;

  const AppDrawerCategoryList({this.parentId, required this.allCategories, super.key});

  @override
  State<AppDrawerCategoryList> createState() => _AppDrawerCategoryListState();
}

class _AppDrawerCategoryListState extends State<AppDrawerCategoryList> {
  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> topMenuCategories = widget.allCategories.where((category) => category.parentCategoryId == widget.parentId).toList();
    return ListView.builder(
        shrinkWrap: true,
        // itemExtent: 75,
        itemBuilder: (context, index) {
          final List<CategoryModel> childCategories = widget.allCategories.where((category) => category.parentCategoryId == topMenuCategories[index].id).toList();
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
                      topMenuCategories[index].description.name,
                      style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                widget.isAdmin
                    ? Row(
                      children: [
                        InkWell(
                            onTap: () {
                              injector<AppDrawerCategoryListBloc>().add(AppDrawerCategoryListDeleteEvent(categoryId: topMenuCategories[index].id));
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                          ),
                        InkWell(
                            onTap: () {
                              context.pushNamed(RouteConstants.adminCategoryName, pathParameters: {'categoryId': topMenuCategories[index].id.toString()});
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
            trailing: childCategories.isNotEmpty ? null : const SizedBox(),
            // subtitle: Text(topMenuCategories[index].description.description),
            children: <Widget>[
              // Дочерние элементы ExpansionTile
              AppDrawerCategoryList(
                allCategories: widget.allCategories,
                parentId: topMenuCategories[index].id,
              ),
            ],
          );
        },
        itemCount: topMenuCategories.length);
  }
}
