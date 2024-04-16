import 'package:flutter/material.dart';

import '../../../../core/domain/entities/menu_category_item_model.dart';
import '../../domain/entities/menu_category_item_model.dart';

class HorizontalMenuCategoryDetail extends StatefulWidget {
  final MenuCategoryItemModel menuCategoryItem;

  const HorizontalMenuCategoryDetail({required this.menuCategoryItem, super.key});

  @override
  State<HorizontalMenuCategoryDetail> createState() => _HorizontalMenuCategoryDetailState();
}

class _HorizontalMenuCategoryDetailState extends State<HorizontalMenuCategoryDetail> {
  late bool isOpen;

@override
void initState() {
  super.initState();
  isOpen = widget.menuCategoryItem.isOpen;
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
                child: Icon(isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 16.0, ),
                onTap: _onTapOpenMenuCategoryItem,
              ),
              Expanded(
                child: Text(
                  widget.menuCategoryItem.topCategory.description.name,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          isOpen
              ? Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        itemExtent: 20,
                        shrinkWrap: true,
                        itemCount: widget.menuCategoryItem.subCategories.length,
                        itemBuilder: (context, index) {
                          final subCategory = widget.menuCategoryItem.subCategories[index];
                          return Text(subCategory.description.name);
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
