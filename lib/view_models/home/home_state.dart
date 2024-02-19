part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class TopHeadlinesLoading extends HomeState{}

final class TopHeadlinesLoaded extends HomeState{
  final TopHeadlinesApiResponse topHeadlinesApiResponse;
  TopHeadlinesLoaded(this.topHeadlinesApiResponse);
}

final class TopHeadlinesError extends HomeState{
  final String message;
  TopHeadlinesError(this.message);
}
