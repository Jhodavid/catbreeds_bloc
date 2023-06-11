import 'package:catbreeds_bloc/domain/entities/breed_image_entity.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';


import 'package:card_loading/card_loading.dart';



class CatImage extends StatelessWidget {

  final double height;
  final List<BreedImagesEntity> imageList;

  const CatImage({
    super.key, 
    required this.height, 
    required this.imageList,
  });

  @override
  Widget build(BuildContext context) {

    if(imageList.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1),
          child: const CardLoading(height: 240)
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1),
        child: CachedNetworkImage(
          imageUrl: imageList[0].url,//todo
          imageBuilder: (context, imageProvider) {
            return Container(
              color: Colors.black,
              width: double.infinity,
              child: Image(
                image: imageProvider,
                fit: BoxFit.fitHeight,
              ),
            );
          },
          placeholder: (context, url) => const CardLoading(height: 240),
          errorWidget: (context, url, error) => CardLoading(
            height: height,
            child: const Center(
              child: Icon(
                Icons.error_outline_rounded, 
                color: Colors.red
              )
            )
          ),
        ),
      ),
    );
  }
}
