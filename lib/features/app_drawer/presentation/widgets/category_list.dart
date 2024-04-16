import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injector.dart';
import '../../../../core/domain/entities/menu_category_item_model.dart';
import '../manager/app_drawer_category_list_bloc.dart';
import 'drawer_admin_category_menu.dart';

class AppDrawerCategoryList extends StatefulWidget {

  const AppDrawerCategoryList({super.key});

  @override
  State<AppDrawerCategoryList> createState() => _AppDrawerCategoryListState();
}

class _AppDrawerCategoryListState extends State<AppDrawerCategoryList> {
  bool _customTileExpanded = false;

  @override
  void initState() {
    injector<AppDrawerCategoryListBloc>().add(AppDrawerCategoryListInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppDrawerCategoryListBloc, AppDrawerCategoryListState>(
      listener: (context, state) {},
      builder: (context, state) {
        return _buildBody(context, state);
      },
    );
  }

  Widget _buildBody(BuildContext context, AppDrawerCategoryListState state) {
    if (state is AppDrawerCategoryListLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is AppDrawerCategoryListErrorState) {
      return Center(
        child: Text(state.error),
      );
    } else if (state is AppDrawerCategoryListSuccessState) {
      // TODO remove (only for testing)
      final List<MenuCategoryItemModel> mainCategories = state.menuCategoryItems + state.menuCategoryItems;
      return Column(
        children: <Widget>[
          ExpansionTile(
            title: InkWell(
              onTap: () {
                // Обработчик нажатия на текст
              },
              child: Text(
                'Category List',
                style: TextStyle(
                  color: Colors.blue, // Цвет ссылки
                  decoration: TextDecoration.underline, // Подчеркивание ссылки
                ),
              ),
            ),
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_drop_down), // Иконка для открытия
            //   onPressed: () {
            //     // Обработчик нажатия на иконку
            //   },
            // ),
            subtitle: Text('Trailing expansion arrow icon'),
            children: <Widget>[
              // Дочерние элементы ExpansionTile
              AppDrawerCategoryList(),
            ],
          ),
        ],
      );
    } else {
      return Container(); // По умолчанию показываем пустой контейнер
    }
  }
}
