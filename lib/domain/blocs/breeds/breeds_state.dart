part of 'breeds_bloc.dart';

abstract class BreedsState extends Equatable {
  const BreedsState();
  
  @override
  List<Object> get props => [];
}

class BreedsInitial extends BreedsState {}
