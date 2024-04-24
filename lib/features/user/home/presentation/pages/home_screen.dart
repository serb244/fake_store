import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injector.dart';
import '../../../app_drawer/presentation/pages/app_drawer.dart';
import '../manager/home_bloc.dart';
import '../widgets/horizontal_menu_category_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double dragOffset = 0.0;
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: const AppDrawer(),
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: GestureDetector(
            onVerticalDragUpdate: (details) {
              // TODO: implement onVerticalDragUpdate show CircularProgressIndicator()

              dragOffset += details.delta.dy;
              print("dragOffset: $dragOffset");
            },
            onVerticalDragEnd: (DragEndDetails details) {
              dragOffset > 150 ? injector<HomeBloc>().add(const HomeInitEvent()) : null;
              dragOffset = 0.0;
            },
            child: _buildBody(context, state),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, HomeState state) {
    if (state is HomeLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is HomeErrorState) {
      return Center(
        child: Text(state.error),
      );
    } else if (state is HomeSuccessState) {
      return const HorizontalMenuCategoryList( );
      // return Container();
    } else {
      return Container();
    }
  }
}
