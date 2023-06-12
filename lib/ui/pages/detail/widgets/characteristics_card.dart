import 'package:flutter/material.dart';


import 'package:catbreeds_bloc/device/localization/app_localizations.dart';

import 'package:catbreeds_bloc/domain/entities/breed_entity.dart';

import 'package:catbreeds_bloc/ui/pages/detail/widgets/progresive_info_card.dart';



class CharacteristicsCard extends StatelessWidget {

  const CharacteristicsCard({
    super.key,
    required this.breed,
  });

  final BreedEntity breed;

  @override
  Widget build(BuildContext context) {

    final localeStrings = AppLocalizations.of(context).detailModule;
    final textStylesTheme = Theme.of(context).textTheme;
    
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localeStrings.characteristicsTitle,
              style: textStylesTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor
              )
            ),
            const SizedBox(height: 5),
            ProgresiveInfo(title: localeStrings.characteristicAdaptability, value: breed.adaptability),
            ProgresiveInfo(title: localeStrings.characteristicAffectionLevel, value: breed.affectionLevel),
            ProgresiveInfo(title: localeStrings.characteristicChildFriendly, value: breed.childFriendly),
            ProgresiveInfo(title: localeStrings.characteristicDogFriendly, value: breed.dogFriendly),
            ProgresiveInfo(title: localeStrings.characteristicEnergyLevel, value: breed.energyLevel),
            ProgresiveInfo(title: localeStrings.characteristicGrooming, value: breed.grooming),
            ProgresiveInfo(title: localeStrings.characteristicHealthIssues, value: breed.healthIssues),
            ProgresiveInfo(title: localeStrings.characteristicIntelligence, value: breed.intelligence),
            ProgresiveInfo(title: localeStrings.characteristicSheddingLevel, value: breed.sheddingLevel),
            ProgresiveInfo(title: localeStrings.characteristicSocialNeeds, value: breed.socialNeeds),
            ProgresiveInfo(title: localeStrings.characteristicStrangerFriendly, value: breed.strangerFriendly),
            ProgresiveInfo(title: localeStrings.characteristicVocalisation, value: breed.vocalisation),
            ProgresiveInfo(title: localeStrings.characteristicExperimental, value: breed.experimental),
            ProgresiveInfo(title: localeStrings.characteristicHairless, value: breed.hairless),
            ProgresiveInfo(title: localeStrings.characteristicNatural, value: breed.natural),
            ProgresiveInfo(title: localeStrings.characteristicRare, value: breed.rare),
            ProgresiveInfo(title: localeStrings.characteristicRex, value: breed.rex),
            ProgresiveInfo(title: localeStrings.characteristicSuppressedTail, value: breed.suppressedTail),
            ProgresiveInfo(title: localeStrings.characteristicShortLegs, value: breed.shortLegs),
            ProgresiveInfo(title: localeStrings.characteristicHypoallergenic, value: breed.hypoallergenic),
          ],
        ),
      ),
    );
  }
}
