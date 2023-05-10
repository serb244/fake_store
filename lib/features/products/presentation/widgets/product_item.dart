import 'package:fake_store/features/products/presentation/widgets/image_cached.dart';
import 'package:flutter/material.dart';

import '../../data/remote/models/products_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ImageCached(imagePath: product.image),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.description,
                  maxLines: 4,
                  // textAlign: TextAlign.left,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price: ${product.price}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Rating: ${product.rating.rate} (${product.rating.count} reviews)',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    IconButton(
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border)),
                    IconButton(
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        onPressed: () {},
                        icon: const Icon(Icons.do_not_touch_outlined)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
