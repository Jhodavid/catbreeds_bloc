part of 'breeds_bloc.dart';

abstract class BreedsEvent extends Equatable {
  const BreedsEvent();

  @override
  List<Object> get props => [];
}

class SetBreedLists extends BreedsEvent {
  final List<BreedEntity> breedList;

  const SetBreedLists(this.breedList);
}

class SetBreedImages extends BreedsEvent {
  final String breedId;
  final List<BreedImagesEntity> breedImages;

  const SetBreedImages({
    required this.breedId,
    required this.breedImages
  });
}

class SetBreedsRequestStates extends BreedsEvent {
  final BreedsRequestStatesEnum state;

  const SetBreedsRequestStates(
    this.state
  );
}