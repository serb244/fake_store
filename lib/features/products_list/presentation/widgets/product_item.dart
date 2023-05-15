import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/router/app_router.dart';
import '../../../../core/data/models/product_model.dart';
import 'image_cached.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        int? spendTime;
        await AutoRouter.of(context)
            .push(ProductDetailRoute(
              // url: product.title,
              productID: product.id,
            ))
            .then((value) => spendTime = value as int?);
        log(spendTime.toString());
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ImageCached(imagePath: product.image),
            const SizedBox(width: 15),
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
                    maxLines: 3,
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
                          onPressed: () {
                            // AutoRouter.of(context).push(Route404());
                            context.router.push(const Route404());
                          },
                          icon: const Icon(Icons.favorite_border)),
                      IconButton(
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          onPressed: () {
                            // final String productPath =
                            //     '${product.title}_${product.id}';
                            // final int productPath = '${product.title}';
                            AutoRouter.of(context).push(
                              (ProductDetailRoute(
                                // url: product.title,
                                productID: product.id,
                                // productModel: product,
                              )),
                            );
                          },
                          icon: const Icon(Icons.do_not_touch_outlined)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
