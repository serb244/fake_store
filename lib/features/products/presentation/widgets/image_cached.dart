import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageCached extends StatelessWidget {
  final String imagePath;
  const ImageCached({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      progressIndicatorBuilder: (context, url, progress) {
        if (progress.progress != null) {
          final percent = progress.progress! * 100;
          return Center(child: Text('$percent% READY'));
        }
        return const Center(child: Text(' READY'));
      },
      imageUrl: imagePath,
      // placeholder: (context, url) => const CircularProgressIndicator(),
      cacheManager: CacheManager(
        Config(
          'customCacheKey',
          stalePeriod: const Duration(days: 7),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        size: 100,
        color: Colors.red,
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.yellow, offset: Offset(2, 2), blurRadius: 5),
            BoxShadow(
                color: Colors.yellow, offset: Offset(-2, 2), blurRadius: 5),
          ],
          // color: Colors.red,
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(width: 1, color: Colors.deepOrange),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
