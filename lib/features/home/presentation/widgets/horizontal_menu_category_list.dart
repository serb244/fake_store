import 'package:flutter/material.dart';

import '../../../../core/domain/entities/menu_category_item_model.dart';
import '../../domain/entities/menu_category_item_model.dart';
import 'horizontal_menu_category_detail.dart';

class HorizontalMenuCategoryList extends StatelessWidget {
  final List<MenuCategoryItemModel> menuCategoryItems;

  const HorizontalMenuCategoryList({super.key, required this.menuCategoryItems});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();

    return ListView.builder(
      itemExtent: 100,
      controller: controller,
      // shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: menuCategoryItems.length,
      itemBuilder: (context, index) {
        final menuCategory = menuCategoryItems[index];
        return HorizontalMenuCategoryDetail(menuCategoryItem: menuCategory);
      },
    );
  }
}
