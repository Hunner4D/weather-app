import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/logic/repositories/geolocater_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final Position position;

  LocationCubit({this.position}) : super(LocationInitial());

  void getPosition(pos) => emit(LocationEnabled(position: pos));
}
