import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import 'package:catbreeds_bloc/ui/pages/detail/widgets/urls_cards.dart';
import 'package:catbreeds_bloc/ui/pages/detail/widgets/simple_info_card.dart';
import 'package:catbreeds_bloc/ui/pages/detail/widgets/description_card.dart';
import 'package:catbreeds_bloc/ui/pages/detail/widgets/characteristics_card.dart';

import 'package:catbreeds_bloc/domain/entities/breed_entity.dart';

import 'package:catbreeds_bloc/ui/widgets/cat_image.dart';

import 'package:catbreeds_bloc/device/localization/app_localizations.dart';



class DetailPage extends StatelessWidget {

  final BreedEntity breed;

  const DetailPage({
    super.key, 
    required this.breed
  });

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
          breed.name,
          style: textStylesTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CatImagesCarousel(
              height: height*0.5,
              fitImages: BoxFit.fitWidth,
              imageList: breed.imagesUrls,
            ),
            SizedBox(
              height: height*0.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DescriptionCard(breed: breed),
                    
                    SimpleInfoCard(title: localeStrings.countryOrigin, value: breed.origin),
                    SimpleInfoCard(title: localeStrings.lifetime, value: '${breed.lifeSpan} ${localeStrings.years}'),
                    SimpleInfoCard(title: localeStrings.weight, value: '${breed.weight.metric} kg'),

                    CharacteristicsCard(breed: breed),

                    URLsCards(breed: breed),

                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

