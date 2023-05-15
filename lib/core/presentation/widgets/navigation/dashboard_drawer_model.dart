// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../consts/routes_constants.dart';

class DashBoardDrawerModel {
  final String title;
  final IconData icon;
  final String route;

  DashBoardDrawerModel({
    required this.title,
    required this.icon,
    required this.route,
  });

  static List<DashBoardDrawerModel> get drawerList => [
        DashBoardDrawerModel(
          title: 'Categories',
          icon: Icons.dashboard,
          route: RoutesConstants.routeCategoryList,
        ),
        DashBoardDrawerModel(
          title: 'All Products',
          icon: Icons.person,
          route: RoutesConstants.routeProductListByCategory,
        ),
      ];
}
