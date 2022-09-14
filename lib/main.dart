import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubit/weather_cubit.dart';
import 'package:weather_app_bloc/data/weather_repository.dart';
import 'package:weather_app_bloc/pages/weather_search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(FakeWeatherRepository()),
      child: MaterialApp(
        title: 'Weather App Bloc',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const WeatherSearchPage(),
      ),
    );
  }
}
