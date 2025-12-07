import 'package:cached_network_image/cached_network_image.dart'; // *
import 'package:r34_16/src/features/intrologin/presentation/widgets/skeleton.dart';
import 'package:flutter/material.dart';
class IntroLoginBackgroundWrapper extends StatelessWidget {
  const IntroLoginBackgroundWrapper({super.key, required this.imageURL});
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          imageURL, 
      imageBuilder: (context, imageProvider) =>
          _IntroLoginBody(image: imageProvider),
      placeholder: (context, url) => const Skeleton(), // *
      errorWidget: (context, url, error) => const Icon(Icons.error), // *
    );
  }
}

class _IntroLoginBody extends StatelessWidget {
  const _IntroLoginBody({
    required this.image, 
  });

  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image, 
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3), // * added overlay for readability
            ),
          ),
        ),
      ],
    );
  }
}
