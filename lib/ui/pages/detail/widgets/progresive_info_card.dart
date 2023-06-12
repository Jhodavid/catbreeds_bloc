import 'package:flutter/material.dart';


import 'package:catbreeds_bloc/device/localization/app_localizations.dart';



class ProgresiveInfo extends StatelessWidget {

  const ProgresiveInfo({
    super.key, 
    required this.title, 
    required this.value,
  });

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width - 50;

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context).breedsModule;

    if(value == 0) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width*0.5,
            child: Text(
              title,
              style: textStylesTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Tooltip(
            message: localeStrings.intelligenceTooltipMessage(value),
            child: SizedBox(
              height: 20,
              width: width*0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                  value: value*0.2,
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}

