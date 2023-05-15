import 'package:auto_route/auto_route.dart';
import 'package:fake_store/core/consts/routes_constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/data/models/category_model.dart';
import '../../../../core/utils/generators/color_generator.dart';
import '../../../../core/utils/router/app_router.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItem({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.router.navigateNamed(
        //     "${RoutesConstants.routeProductListAll}?categoryNameNew=${categoryModel.name}");
        // context.router
        //     .navigate(ProductsListRoute(categoryName: categoryModel.name));
        context.router
            .push(ProductsListRoute(categoryName: categoryModel.name));
      },
      child: Container(
        color: ColorGenerator().getRandomColor(),
        child: Center(
          child: Text(categoryModel.name.toUpperCase()),
        ),
      ),
    );
  }
}
