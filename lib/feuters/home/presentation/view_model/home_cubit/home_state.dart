part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetNewsLoading extends HomeState {}

final class HomeGetNewsScrollLoading extends HomeState {}

final class HomeGetNewsSucsess extends HomeState {}

final class HomeGetNewsFailure extends HomeState {
  final String errMessage;
  HomeGetNewsFailure(this.errMessage);
}

////

final class HomeDeleteLoading extends HomeState {}

final class HomeDeleteFailure extends HomeState {
  final String errMessage;
  HomeDeleteFailure(this.errMessage);
}

final class HomeDeleteSucsess extends HomeState {
  final String message;
  HomeDeleteSucsess(this.message);
}

////

final class NewsCountLoading extends HomeState {}

final class NewsCountScrollLoading extends HomeState {}

final class NewsCountSucsess extends HomeState {
  final int count;
  NewsCountSucsess(this.count);
}

final class NewsCountFailure extends HomeState {
  final String errMessage;
  NewsCountFailure(this.errMessage);
}
