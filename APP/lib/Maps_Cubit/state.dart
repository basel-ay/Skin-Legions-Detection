import 'package:flutter_application_1/model/place.dart';
import 'package:flutter_application_1/model/place_direction.dart';
import 'package:flutter_application_1/model/place_suggestion.dart';


abstract class MapsState {}

class MapsInitial extends MapsState {}

class PlacesLoaded extends MapsState {
 final List<PlaceSuggestion> places;

 PlacesLoaded(this.places);

}

class PlaceLocationLoaded extends MapsState {
 final Place place;

 PlaceLocationLoaded(this.place);

}


class DirectionsLoaded extends MapsState {
 final PlaceDirections placeDirections;

 DirectionsLoaded(this.placeDirections);

}