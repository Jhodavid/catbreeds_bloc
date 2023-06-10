import 'package:flutter/material.dart';


import 'package:catbreeds_bloc/device/language/app_localizations.dart';



class DetailPage extends StatelessWidget {

  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final localeStrings = AppLocalizations.of(context).breedsModule;

    return Scaffold(
      body: Center(
        child: Text(
          localeStrings.mDefault
        ),
      ),
    );
  }
}