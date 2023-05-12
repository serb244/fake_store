import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/domain/repository/category_repository.dart';
import '../manager/category_list_bloc.dart';
import '../widgets/category_item.dart';

@RoutePage()
class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CategoryListScreen')),
      body: BlocProvider(
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
                      children:
                          List.generate(state.categoryList.length, (index) {
                        return CategoryItem(
                          categoryModel: state.categoryList[index],
                        );
                      }),
                    );
            },
          )),
    );
  }
}
