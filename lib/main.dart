import 'package:aahwanam/routes/app_pages.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aahwanam/blocs/Packages/events_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => EventBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aahwanam App',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppPages.onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}