import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';


import 'package:card_loading/card_loading.dart';



class CatImage extends StatelessWidget {

  final double height;

  const CatImage({
    super.key, 
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: 'https://cdn2.thecatapi.com/images/xnzzM6MBI.jpg',//todo
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
