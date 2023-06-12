import 'package:flutter/material.dart';

import 'package:card_loading/card_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';


import 'package:catbreeds_bloc/data/utils/enums/breeds_request_status_enum.dart';

import 'package:catbreeds_bloc/device/localization/app_localizations.dart';

import 'package:catbreeds_bloc/domain/blocs/breeds/breeds_bloc.dart';
import 'package:catbreeds_bloc/domain/entities/breed_image_entity.dart';



class CatImagesCarousel extends StatefulWidget {

  final double height;
  final BoxFit fitImages;
  final List<BreedImagesEntity> imageList;

  const CatImagesCarousel({
    super.key,
    required this.height,
    required this.fitImages,
    required this.imageList, 
  });

  @override
  State<CatImagesCarousel> createState() => _CatImagesCarouselState();
}

class _CatImagesCarouselState extends State<CatImagesCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.imageList.isEmpty) {
      return BlocBuilder<BreedsBloc, BreedsState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            height: widget.height,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: const CardLoading(height: 240)),
          );
        },
      );
    }

    return BlocSelector<BreedsBloc, BreedsState, bool>(
      selector: (state) => widget.imageList.isEmpty && state.requestState == BreedsRequestStatesEnum.complete,
      builder: (context, isEmptyImagesList) {

        if(isEmptyImagesList) {
          return _NoFoundImageMessage(
            height: widget.height,
          );
        }
        
        return Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              height: widget.height,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: widget.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                itemCount: widget.imageList.length,
                itemBuilder: (context, index, realIndex) {
                  return CachedNetworkImage(
                    imageUrl: widget.imageList[index].url,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        color: Colors.black,
                        width: double.infinity,
                        child: Image(
                          image: imageProvider,
                          fit: widget.fitImages,
                        ),
                      );
                    },
                    placeholder: (context, url) =>
                        const CardLoading(height: 240),
                    errorWidget: (context, url, error) => CardLoading(
                        height: widget.height,
                        child: const Center(
                            child: Icon(Icons.error_outline_rounded,
                                color: Colors.red))),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.height - 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      child: Container(
                        width: 11,
                        height: 11,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context)
                              .secondaryHeaderColor
                              .withOpacity(currentIndex == entry.key ? 0.9 : 0.4),
                            width: 2.5
                          ),
                          color: (Theme.of(context).primaryColor).withOpacity(
                            currentIndex == entry.key ? 0.9 : 0.4
                          )
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _NoFoundImageMessage extends StatelessWidget {

  final double height;

  const _NoFoundImageMessage({required this.height});

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final localeStrings = AppLocalizations.of(context);

    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_rounded,
          ),
          const SizedBox(height: 5),
          Text(
            localeStrings.noImageFound,
            style: textStylesTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
