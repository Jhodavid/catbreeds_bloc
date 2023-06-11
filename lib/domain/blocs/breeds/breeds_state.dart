part of 'breeds_bloc.dart';

class BreedsState {

  final BreedsRequestStatesEnum requestStates;
  final List<BreedEntity> breedList;

  const BreedsState({
    this.requestStates = BreedsRequestStatesEnum.none,
    this.breedList = const []
  });


  BreedsState copyWith({
    BreedsRequestStatesEnum? requestStates,
    List<BreedEntity>? breedList,
  }) => BreedsState(
    requestStates: requestStates ?? this.requestStates,
    breedList: breedList ?? this.breedList
  );

}

const initState = BreedsState();
