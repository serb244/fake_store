import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../products/data/remote/models/products_model.dart';

@RoutePage()
class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.productModel, Key? key}) : super(key: key);
  final ProductModel productModel;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _secondsCounter = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsCounter++;
      });
    });
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop<int>(context, _secondsCounter),
        ),
      ),
      body: Center(child: Text(_secondsCounter.toString())),
    );
  }
}
