import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubit/location_cubit.dart';
import 'package:weather_app/logic/repositories/geolocater_repo.dart';
import 'package:weather_app/presentation/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key, this.context}) : super(key: key);

  final BuildContext context;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is LocationEnabled) {
          Navigator.of(context).pushNamed(
            '/location',
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
