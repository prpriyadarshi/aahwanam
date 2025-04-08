import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login/login_bloc.dart';

import '../screens/login/login_screen.dart';
import 'app_routes.dart';

class AppPages {
  // static Route<dynamic> onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case AppRoutes.login:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider(
  //           create: (_) => LoginBloc(),
  //           child: const LoginScreen(),
  //         ),
  //       );
  //     // case AppRoutes.dashboard:
  //     //   return MaterialPageRoute(
  //     //     builder: (_) => const DashboardScreen(),
  //     //   );
  //     // case AppRoutes.profile:
  //     //   return MaterialPageRoute(
  //     //     builder: (_) => const ProfileScreen(),
  //     //   );
  //     default:
  //       return MaterialPageRoute(
  //         builder: (_) => const LoginScreen(),
  //       );
  //   }
  // }
}
