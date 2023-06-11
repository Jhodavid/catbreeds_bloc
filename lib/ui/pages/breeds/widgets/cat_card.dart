import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import 'package:catbreeds_bloc/ui/widgets/cat_image.dart';

import 'package:catbreeds_bloc/ui/router/app_routes.dart';

import 'package:catbreeds_bloc/device/language/app_localizations.dart';



class CatCard extends StatelessWidget {
  
  const CatCard({super.key});

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Theme.of(context).secondaryHeaderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Nombre de la raza',//todo
                    style: textStylesTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  icon: const Icon( Icons.read_more_rounded),
                  label: Text(
                    localeStrings.readMore,
                    style: textStylesTheme.bodyMedium,
                  ),
                  onPressed: () => context.push(AppRoutesEnum.detail.path)
                )
              ],
            ),

            const CatImage(height: 240),

            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Colombia',//todo
                      style: textStylesTheme.titleSmall,
                    ),
                    const Spacer(),
                    Text(
                      localeStrings.intelligence,
                      style: textStylesTheme.titleSmall,
                    ),
                    Tooltip(
                      message: localeStrings.intelligenceTooltipMessage(2),//todo
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      triggerMode: TooltipTriggerMode.tap,
                      child: Container(
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(7),
                        child: const CircularProgressIndicator(
                          strokeWidth: 10,
                          value: 2*0.2,//todo
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}