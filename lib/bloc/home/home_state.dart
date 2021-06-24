import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class HomeState extends Equatable {
  final int bottomNavigationIndex;

  HomeState({this.bottomNavigationIndex = 0});

  @override
  List<Object> get props => [bottomNavigationIndex];

  HomeState copyWith({int bottomNavigationIndex}) {
    return HomeState(
      bottomNavigationIndex:
          bottomNavigationIndex ?? this.bottomNavigationIndex,
    );
  }
}

class InitialHomeState extends HomeState {
  @override
  String toString() => 'InitialHomeState';

  @override
  List<Object> get props => [];
}

class HomeSuccess extends HomeState {
  @override
  String toString() => 'HomeSuccess';

  @override
  List<Object> get props => [];
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'HomeFailure { error: $error }';
}

class HomeLoading extends HomeState {
  final String title;
  final String message;

  HomeLoading({this.title, this.message});

  @override
  String toString() => 'HomeLoading {title : $title, message: $message}';

  @override
  List<Object> get props => [title, message];
}
