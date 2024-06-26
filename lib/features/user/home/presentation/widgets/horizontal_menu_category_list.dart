import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/blocs/category/category_bloc.dart';
import '../../../../../core/data/models/category/category_model.dart';
import 'horizontal_menu_category_detail.dart';

class HorizontalMenuCategoryList extends StatelessWidget {
  const HorizontalMenuCategoryList({super.key});

  @override
  Widget build(BuildContext context) {

    // injector<CategoryBloc>().add(const CategoryInitEvent());
    final ScrollController controller = ScrollController();
    return  BlocConsumer<CategoryBloc, CategoryState>(
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
          } else if (state is CategorySuccessState ) {
            final List<CategoryModel> topCategories = getChildCategoryList(categoryId: null, categoryList: state.allCategories);
            return  ListView.builder(
              itemExtent: 100,
              controller: controller,
              reverse:  true,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: topCategories.length,
              itemBuilder: (context, index) {
                final CategoryModel menuCategory = topCategories[index];
                return HorizontalMenuCategoryDetail(subCategories: state.allCategories, topMenuCategory: menuCategory);
              },
            );
          } else {
            return Container();
          }
        });

  }
}