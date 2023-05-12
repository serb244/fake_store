import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/data/models/category_model.dart';
import '../../../../core/utils/generators/color_generator.dart';
import '../../../../core/utils/router/routes.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItem({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context)
            .push(ProductsListRoute(categoryName: categoryModel.name));
      },
      child: Container(
        color: ColorGenerator().getRandomColor(),
        child: Center(child: Text(categoryModel.name.toUpperCase())),
      ),
    );
  }
}
