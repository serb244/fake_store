import 'package:fake_store/core/domain/repository/category_repository.dart';
import 'package:fake_store/features/category_list/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../manager/category_list_bloc.dart';

class CategoryListScreenStateBlocProvider extends StatelessWidget {
  const CategoryListScreenStateBlocProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoryListBloc(GetIt.I<CategoryRepository>())
          ..add(CategoryListGetAllCategoryEvent()),
        child: BlocBuilder<CategoryListBloc, CategoryListState>(
          builder: (context, state) {
            return state.categoryList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(state.categoryList.length, (index) {
                      return CategoryItem(
                          categoryModel: state.categoryList[index]);
                    }),
                  );
          },
        ));
  }
}
