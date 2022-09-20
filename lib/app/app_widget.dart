import 'package:flutter/material.dart';
import 'package:flutter_plants_app_v2/app/data/services/pokedex_controller.dart';
import 'package:flutter_plants_app_v2/app/views/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Pokedex extends StatelessWidget {
  Pokedex({super.key});
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PokedexController>(
          create: (_) => PokedexController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: tema.textTheme.copyWith(
            headline6: GoogleFonts.rubik(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: HexColor('184C5C'),
            ),
            subtitle1: GoogleFonts.rubik(
              fontSize: 17,
              color: HexColor('184C5C'),
            ),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
