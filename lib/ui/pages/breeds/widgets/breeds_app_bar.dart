import 'package:flutter/material.dart';

import 'package:rive/rive.dart';


import 'package:catbreeds_bloc/device/language/app_localizations.dart';


class BreedsAppBar extends StatelessWidget {

  const BreedsAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;

    final statusBarPadding = MediaQuery.of(context).padding.top;


    return Container(
      padding: EdgeInsets.only(
        top: statusBarPadding
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,            
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10
                      ),
                      child: Text(
                        localeStrings.title,
                        style: textStylesTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                _SearchInput()
              ],
            ),
          ),
          const SizedBox(
            height: 100,
            width: 100,
            child: RiveAnimation.asset('assets/animations/cat.riv')
          ),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;

    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: width*0.07, top: 7),
      child: Container(
        height: 45,
        width: width*0.62,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          style: textStylesTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: localeStrings.searchInputHint
          ),
          cursorColor: Theme.of(context).primaryColor,
        )
      )
    );
  }
}