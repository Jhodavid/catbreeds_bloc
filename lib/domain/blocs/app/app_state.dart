part of 'app_bloc.dart';

class AppState extends Equatable {

  final bool isDarkMode;

  const AppState({
    this.isDarkMode = false
  });


  AppState copyWith({
    bool? isDarkMode
  }) => AppState(
    isDarkMode: isDarkMode ?? this.isDarkMode
  );


  @override
  List<Object> get props => [isDarkMode];
}

const initState = AppState();
