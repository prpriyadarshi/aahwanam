import 'package:aahwanam/blocs/Photographer/photographer_bloc.dart';
import 'package:aahwanam/blocs/bartender/bartender_bloc.dart';
import 'package:aahwanam/blocs/chef/chef_bloc.dart';
import 'package:aahwanam/blocs/entertainment/entertainment_bloc.dart';
import 'package:aahwanam/blocs/makeup/makeup_bloc.dart';
import 'package:aahwanam/blocs/mehndi/mehndi_bloc.dart';
import 'package:aahwanam/screens/Photographer/photographer_screen.dart';
import 'package:aahwanam/screens/dashboard/bartender_screen.dart';
import 'package:aahwanam/screens/dashboard/chef_screen.dart';
import 'package:aahwanam/screens/dashboard/entertainment_screen.dart';
import 'package:aahwanam/screens/dashboard/makeup_screen.dart';
import 'package:aahwanam/screens/dashboard/mehndi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/dashboard/dashboard_bloc.dart';
import '../blocs/login/login_bloc.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../blocs/account/account_bloc.dart';
import '../blocs/account/account_event.dart';
import '../screens/account/account_screen.dart';
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

      case AppRoutes.account:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AccountBloc(),
            child: AccountScreen(),
          ),
        );


      case AppRoutes.photographer:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => PhotographerBloc(),
            child: PhotographerScreen(),
          ),
        );


      case AppRoutes.chef:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => ChefBloc(),
            child: ChefScreen(),
          ),
        );

      case AppRoutes.bartender:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => BartenderBloc(),
            child: BartenderScreen(),
          ),
        );

      case AppRoutes.makeup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MakeupBloc(),
            child: MakeupScreen(),
          ),
        );

      case AppRoutes.entertainment:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => EntertainmentBloc(),
            child: EntertainmentScreen(),
          ),
        );

      case AppRoutes.mehndi:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MehndiBloc(),
            child: MehndiScreen(),
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


