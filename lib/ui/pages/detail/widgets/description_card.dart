import 'package:flutter/material.dart';


import 'package:catbreeds_bloc/domain/entities/breed_entity.dart';



class DescriptionCard extends StatelessWidget {

  const DescriptionCard({
    super.key, 
    required this.breed,
  });

  final BreedEntity breed;

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8
      ),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
        )
      ),
      child: Text(
        breed.description,
        style: textStylesTheme.bodyMedium?.copyWith(
          color: Theme.of(context).secondaryHeaderColor
        ),
      ),
    );
  }
}