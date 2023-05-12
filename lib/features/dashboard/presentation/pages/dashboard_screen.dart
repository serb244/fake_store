import 'package:auto_route/auto_route.dart';
import 'package:fake_store/core/utils/generators/color_generator.dart';
import 'package:fake_store/features/products_list/presentation/pages/products_screen.dart';
import 'package:flutter/material.dart';

import '../../../category_list/presentation/pages/category_list.dart';

@RoutePage()
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('MAIN PAGE')),
    CategoryListScreen(),
    ProductsListScreen(),
    Center(
      child: Text('CART'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
            backgroundColor: ColorGenerator().getRandomColor(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: 'category',
            backgroundColor: ColorGenerator().getRandomColor(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.interpreter_mode_sharp),
            label: 'All Products',
            backgroundColor: ColorGenerator().getRandomColor(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: 'shopping_cart',
            backgroundColor: ColorGenerator().getRandomColor(),
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
