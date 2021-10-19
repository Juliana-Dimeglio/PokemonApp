import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/util/string_constants.dart';

class PokemonPresentationCard extends StatelessWidget {
  const PokemonPresentationCard({
    Key? key,
    required this.imageUrl,
    this.imageFit = BoxFit.contain,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit imageFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => Image.asset(
        StringConstants.noImageAvailable,
        fit: imageFit,
      ),
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => Image.asset(
        StringConstants.errorImage,
        fit: imageFit,
      ),
    );
  }
}
