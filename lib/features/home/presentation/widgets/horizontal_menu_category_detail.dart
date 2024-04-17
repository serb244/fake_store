import 'package:flutter/material.dart';

import '../../../../core/data/models/category_model.dart';

class HorizontalMenuCategoryDetail extends StatefulWidget {
  final CategoryModel menuCategoryItem;
  final List<CategoryModel> allCategories;

  const HorizontalMenuCategoryDetail({required this.menuCategoryItem,  required this.allCategories, super.key});

  @override
  State<HorizontalMenuCategoryDetail> createState() => _HorizontalMenuCategoryDetailState();
}

class _HorizontalMenuCategoryDetailState extends State<HorizontalMenuCategoryDetail> {
  late bool isOpen;

@override
void initState() {
  super.initState();
  isOpen = false;
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: _onTapOpenMenuCategoryItem,
                child: Icon(isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 16.0, ),
              ),
              Expanded(
                child: Text(
                  widget.menuCategoryItem.description.name,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          isOpen
              ?
          Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        itemExtent: 20,
                        shrinkWrap: true,
                        itemCount: getChildCategoryList(categoryId: widget.menuCategoryItem.id , categoryList: widget.allCategories).length,
                        itemBuilder: (context, index) {
                          final subCategory = getChildCategoryList(categoryId: widget.menuCategoryItem.id , categoryList: widget.allCategories) ;
                          return Text(subCategory[index].description.name);
                        }),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void _onTapOpenMenuCategoryItem () {
    setState(() {
      isOpen = !isOpen;
    });
  }
}
