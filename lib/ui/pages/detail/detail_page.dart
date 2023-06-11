import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import 'package:catbreeds_bloc/ui/widgets/cat_image.dart';

import 'package:catbreeds_bloc/device/language/app_localizations.dart';



class DetailPage extends StatelessWidget {

  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final localeStrings = AppLocalizations.of(context).detailModule;
    
    final textStylesTheme = Theme.of(context).textTheme;


    final height = MediaQuery.of(context).size.height - (
      MediaQuery.of(context).padding.top +
      MediaQuery.of(context).padding.bottom +
      50
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: TextButton(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Text(
          'Una raza',//todo
          style: textStylesTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CatImage(
              height: height*0.5,
              imageList: [],
            ),
            Container(
              color: Colors.red,
              height: height*0.5,
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    localeStrings.mDefault
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}