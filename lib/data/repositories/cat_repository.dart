import 'package:flutter/foundation.dart';

import 'package:catbreeds_bloc/data/services/cat_api_dio_service.dart';

import 'package:catbreeds_bloc/domain/entities/breed_image_entity.dart';
import 'package:catbreeds_bloc/domain/entities/breed_entity.dart';

import 'package:catbreeds_bloc/domain/repositories/abstract_cat_repository.dart';



class CatRepository extends AbstactCatRepository {

  @override
  Future<List<BreedEntity>?>  getCatBreeds() async {
    try {
      
      final response = await CatApiDioService.catApiDio.get(
        '/breeds'
      );

      return List<BreedEntity>.from(
        response.data.map(
          (json) => BreedEntity.fromJson(json)
        )
      );

    } catch (e) {
      if(kDebugMode) print(e);
      return null;
    }
  }

  @override
  Future<List<BreedImagesEntity>?> getCatBreedImages(String breedId) async {
    try {
      
      final response = await CatApiDioService.catApiDio.get(
        '/images/search?limit=3&breed_ids=$breedId'
      );

      return List<BreedImagesEntity>.from(
        response.data.map(
          (json) => BreedImagesEntity.fromJson(json)
        )
      );

    } catch (e) {
      if(kDebugMode) print(e);
      return null;
    }
  }

}