
import 'package:fake_store/core/data/models/category_model.dart';
import 'package:fake_store/core/di/di.dart';
import 'package:fake_store/features/app_drawer/presentation/pages/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_drawer/presentation/manager/app_drawer_category_list_bloc.dart';
import '../manager/home_bloc.dart';
import '../widgets/horizontal_menu_category_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if(state is HomeSuccessState){
          injector<AppDrawerCategoryListBloc>().allCategories = [... injector<HomeBloc>().allCategories];
        }
      },
      builder: (context, state) {
        return Scaffold(
          drawer:const AppDrawer(),
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, HomeState state) {
    if (state is HomeLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else
      if (state is HomeErrorState) {
      return Center(
        child: Text(state.error),
      );
    } else if (state is HomeSuccessState) {
      // TODO remove (only for testing)
      final List<CategoryModel> categories = state.categoryList + state.categoryList;
      return HorizontalMenuCategoryList (allCategoryList:categories );
    } else {
      return Container(); // По умолчанию показываем пустой контейнер
    }
  }


}
