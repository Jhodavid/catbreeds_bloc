import 'package:catbreeds_bloc/device/language/app_localizations.dart';
import 'package:flutter/material.dart';




class BreedsPage extends StatelessWidget {

  const BreedsPage({super.key});

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