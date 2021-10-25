import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../../core/util/numeric_constants.dart';
import '../../data/model/pokemon_sprites.dart';

class PokemonsArtworkSwiper extends StatelessWidget {
  const PokemonsArtworkSwiper({
    required this.pokemonSprites,
  });

  final PokemonSprites pokemonSprites;

  List<String> spritesUrl() {
    var urls = <String>[];
    pokemonSprites.toMap().forEach((key, value) {
      if (value != null) {
        urls.add(value);
      }
    });
    return urls;
  }

  @override
  Widget build(BuildContext context) {
    var urls = spritesUrl();
    return Swiper(
      control: SwiperControl(
        color: Colors.black,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Image.network(
            urls[index],
            width: NumericConstants.detailImageSize,
            height: NumericConstants.detailImageSize,
            scale: NumericConstants.galleryImageScale,
          ),
        );
      },
      itemCount: urls.length,
    );
  }
}
