import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/logic/repositories/geolocater_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  StreamSubscription positionStreamSubscription;

  LocationCubit() : super(LocationInitial());

  void getPosition() async {
    await determinePosition()
        .then((res) => emit(LocationEnabled(position: res)))
        .catchError((err) => print(err));
  }

  @override
  Future<void> close() {
    positionStreamSubscription.cancel();
    return super.close();
  }
}
