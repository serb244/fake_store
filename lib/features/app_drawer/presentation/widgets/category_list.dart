import 'package:fake_store/core/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_constants.dart';

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
  void initState() {
    print("AppDrawerCategoryList initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("AppDrawerCategoryList didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> topMenuCategories = widget.allCategories.where((category) => category.parentCategoryId == widget.parentId).toList();
    return ListView.builder(
        shrinkWrap: true,
        // itemExtent: 75,
        itemBuilder: (context, index) {
          final List<CategoryModel> cc = widget.allCategories.where((category) => category.parentCategoryId == topMenuCategories[index].id).toList();
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
                    ? InkWell(
                        onTap: () {
                          context.pushNamed(RouteConstants.adminCategoryName, pathParameters: {'categoryId': topMenuCategories[index].id.toString()});
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      )
                    : Container(),
              ],
            ),
            trailing: cc.isNotEmpty ? null : const SizedBox(),
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
