import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubit/location_cubit.dart';
import 'package:weather_app/logic/repositories/geolocater_repo.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() {
    try {
      BlocProvider.of<LocationCubit>(context).getPosition();
    } catch (err) {
      print(err);
    } finally {
      Navigator.of(context).pushNamed(
        '/city',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
              if (state is LocationEnabled) {
                return Text('${state.position}');
              } else {
                return Text('enable to proceed');
              }
            }),
            ElevatedButton(
              onPressed: () => getLocation(),
              child: Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
