import 'package:bloc/bloc.dart';
import 'package:catbreeds_bloc/data/repositories/cat_repository.dart';
import 'package:catbreeds_bloc/data/utils/enums/breeds_request_status_enum.dart';
import 'package:equatable/equatable.dart';


import 'package:catbreeds_bloc/domain/entities/breed_entity.dart';
import 'package:catbreeds_bloc/domain/entities/breed_image_entity.dart';


part 'breeds_event.dart';
part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {

  final _catRepository = CatRepository();

  BreedsBloc() : super(initState) {

    on<SetBreedLists>((event, emit) {
      emit(state.copyWith(
        breedList: event.breedList
      ));
    });

    on<SetBreedImages>((event, emit) {

      final auxBreedList = state.breedList;
      final auxBreedIndex = state.breedList.indexWhere((element) => element.id == event.breedId);
      final auxBreed = state.breedList[auxBreedIndex];

      auxBreedList[auxBreedIndex] = auxBreed.copyWith(
        imagesUrls: event.breedImages
      );

      emit(state.copyWith(
        breedList: auxBreedList
      ));
    });

    on<SetBreedsRequestStates>((event, emit) {
      emit(state.copyWith(
        requestStates: event.state
      ));
    });

  }
  

  //For breeds data
  late int countCallbacks;
  late int maxCountCallbacks;

  Future<void> getCatBreedsData() async {
    add(const SetBreedsRequestStates(BreedsRequestStatesEnum.loadingBreeds));

    final breedListData = await _catRepository.getCatBreeds();

    if(breedListData != null) {
      add(SetBreedLists(breedListData));
      
      maxCountCallbacks = breedListData.length;
      for (var breed in breedListData) {
        getBreedImage(breed.id);
      }

      return;
    }

    add(const SetBreedsRequestStates(BreedsRequestStatesEnum.error));

  }

  Future<void> getBreedImage(String breedId) async {

    final breedImages = await _catRepository.getCatBreedImages(breedId);

    if(breedImages != null) {
      add(SetBreedImages(
        breedId: breedId, 
        breedImages: breedImages
      ));

      return;
    }

  }

}

