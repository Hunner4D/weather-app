import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/cubit/location_cubit.dart';
import 'package:weather_app/presentation/router/app_router.dart';

void main() => runApp(
      MyApp(
        appRouter: AppRouter(),
      ),
    );

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key key, @required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LocationCubit(),
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (_, state) {
            return MaterialApp(
              theme: ThemeData.dark(),
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          },
        ));
  }
}
