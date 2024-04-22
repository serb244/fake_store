import 'package:flutter/material.dart';

import '../../../../core/data/models/category/category_model.dart';
import 'horizontal_menu_category_detail.dart';

class HorizontalMenuCategoryList extends StatelessWidget {
  final List<CategoryModel> allCategoryList;

  const HorizontalMenuCategoryList({super.key, required this.allCategoryList});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    final List<CategoryModel> topCategories = getChildCategoryList(categoryId: null, categoryList: allCategoryList);
    return ListView.builder(
      itemExtent: 100,
      controller: controller,
      reverse:  true,
      // shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: topCategories.length,
      itemBuilder: (context, index) {
        final CategoryModel menuCategory = topCategories[index];
        return HorizontalMenuCategoryDetail(allCategories: allCategoryList, menuCategoryItem: menuCategory);
      },
    );
  }
}
