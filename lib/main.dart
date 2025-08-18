import 'package:aahwanam/routes/app_pages.dart';
import 'package:aahwanam/routes/app_routes.dart';
import 'package:aahwanam/widgets/book_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aahwanam/blocs/Packages/events_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EventBloc()), // Existing EventBloc
        BlocProvider(create: (context) => BookingCubit(basePrice: 0, barTablePrice: 0)), // ✅ Add BookingCubit
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aahwanam App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppPages.onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
