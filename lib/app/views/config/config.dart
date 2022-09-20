import 'package:flutter/material.dart';
import 'package:flutter_plants_app_v2/app/shared/constants/constants.dart';
import 'package:flutter_plants_app_v2/app/shared/constants/constants_api.dart';

class Config extends StatelessWidget {
  const Config({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Este app foi criado por Caio Andrade',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              Text(
                'Sinta-se livre para me contratar!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
              Text(Constants.emailCaio),
              Text(Constants.linkedinCaio),
              Text(Constants.githubCaio),
              Text(
                'API utilizada (http get):',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
              Text(ConstantsApi.pokeapiURL),
            ],
          ),
        ),
      ),
    );
  }
}
