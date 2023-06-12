part of 'breeds_bloc.dart';

class BreedsState {

  final BreedsRequestStatesEnum requestState;
  final List<BreedEntity> breedList;

  const BreedsState({
    this.requestState = BreedsRequestStatesEnum.none,
    this.breedList = const []
  });


  BreedsState copyWith({
    BreedsRequestStatesEnum? requestState,
    List<BreedEntity>? breedList,
  }) => BreedsState(
    requestState: requestState ?? this.requestState,
    breedList: breedList ?? this.breedList
  );

}

const initState = BreedsState();
