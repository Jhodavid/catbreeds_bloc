
import 'package:catbreeds_bloc/domain/entities/breed_entity.dart';
import 'package:catbreeds_bloc/domain/entities/breed_image_entity.dart';

abstract class AbstactCatRepository {

  Future<List<BreedEntity>?> getCatBreeds();

  Future<List<BreedImagesEntity>?> getCatBreedImages(String breedId);

}