part of 'home_cubic.dart';


sealed class HomeState{
  const HomeState();

  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Championship> championships;

  const HomeSuccess({required this.championships});

  @override
  List<Object> get props => [championships];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
