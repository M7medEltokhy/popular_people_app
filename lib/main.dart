import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itproject/data/cubits/album_cubit/album_cubit.dart';
import 'package:itproject/data/cubits/details_cubit/details_cubit.dart';
import 'package:itproject/data/cubits/popular_people_cubit/popular_people_cubit.dart';
import 'package:itproject/prisentation/screens/home_screen.dart';
import 'package:itproject/prisentation/screens/profile_screen.dart';
import 'package:itproject/prisentation/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<PopularPeopleCubit>(create: (BuildContext context) => PopularPeopleCubit()),
      BlocProvider<DetailsCubit>(create: (BuildContext context) => DetailsCubit()),
      BlocProvider<AlbumCubit>(create: (BuildContext context) => AlbumCubit()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splashscreen(),
    );
  }
}
