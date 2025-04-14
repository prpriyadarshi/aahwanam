import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/dashboard/dashboard_bloc.dart';
import '../blocs/login/login_bloc.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/login/login_screen.dart';
import 'app_routes.dart';

class AppPages {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.login:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (_) => Login(),
      //       child: LoginScreen(),
      //     ),
      //   );

      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => DashboardBloc(),
            child: DashboardScreen(),
          ),
        );

      default:
      // Default route for undefined paths
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
