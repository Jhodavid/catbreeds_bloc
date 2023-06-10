import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'breeds_event.dart';
part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  BreedsBloc() : super(BreedsInitial()) {
    on<BreedsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
