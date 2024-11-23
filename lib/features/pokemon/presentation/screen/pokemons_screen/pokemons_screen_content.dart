import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:starter_application/features/pokemon/presentation/screen/pokemons_screen/pokemons_screen_content_mobile.dart';
import 'package:starter_application/features/pokemon/presentation/screen/pokemons_screen/pokemons_screen_content_tablet.dart';

class PoekmonsScreenContent extends StatelessWidget {
  const PoekmonsScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => PokemonsScreenContentMobile(),
      tablet: (_) => PokemonsScreenContentTablet(),
    );
  }
}
