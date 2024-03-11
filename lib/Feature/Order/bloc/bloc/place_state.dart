part of 'place_bloc.dart';

@immutable
sealed class PlaceState {}

final class PlaceInitial extends PlaceState {}

class LoadingState extends PlaceState {}

class SuccessToGetPlacesState extends PlaceState {
  PlacesModel places;
  SuccessToGetPlacesState({
    required this.places,
  });
}

class FailedToLoadPlacesState extends PlaceState {
  ErrorModel error;
  FailedToLoadPlacesState({
    required this.error,
  });
}