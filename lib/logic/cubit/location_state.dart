part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationDisabled extends LocationState {}

class LocationDenied extends LocationState {}

class LocationEnabled extends LocationState {
  final Position position;

  LocationEnabled({@required this.position});
}
