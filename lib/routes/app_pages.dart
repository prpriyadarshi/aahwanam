import 'package:aahwanam/blocs/Packages/events_bloc.dart';
import 'package:aahwanam/blocs/account/account_bloc.dart';
import 'package:aahwanam/blocs/concepts/concepts_bloc.dart';
import 'package:aahwanam/blocs/eInvitation/eInvitation_bloc.dart';
import 'package:aahwanam/screens/account/account_screen.dart';
import 'package:aahwanam/screens/dashboard/entertainment_book_service_screen.dart';
import 'package:aahwanam/screens/dashboard/photograph_book_service_screen.dart';
import 'package:aahwanam/screens/concepts/concepts_screen.dart';
import 'package:aahwanam/screens/dashboard/e_invitation_screen.dart';
import 'package:aahwanam/screens/dashboard/entertainment_all_details_screen.dart';
import 'package:aahwanam/screens/dashboard/entertainment_all_services_sub_list.dart';
import 'package:aahwanam/screens/dashboard/photo_videographers_screen.dart';
import 'package:aahwanam/screens/dashboard/view_all_packages.dart';
import 'package:aahwanam/services/services_screen.dart';
import 'package:aahwanam/widgets/custom_photograph_servicecard.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/Pandit/Pandit_bloc.dart';
import '../blocs/Photographer/photographer_bloc.dart';
import '../blocs/Subcategory/subcategory bloc.dart';
import '../blocs/bartender/bartender_bloc.dart';
import '../blocs/chef/chef_bloc.dart';
import '../blocs/dashboard/dashboard_bloc.dart';
import '../blocs/decor/decor_bloc.dart';
import '../blocs/entertainment/entertainment_bloc.dart';
import '../blocs/makeup/makeup_bloc.dart';
import '../blocs/mehndi/mehndi_bloc.dart';
import '../blocs/valetParking/valetParking_bloc.dart';
import '../screens/Packages/event_details_popup.dart';
import '../screens/Packages/event_details_screen.dart';
import '../screens/Packages/events_screen.dart';
import '../screens/Subcategory/subcategory_screen.dart';
import '../screens/auth/otp_verification_screen.dart';
import '../screens/auth/home_screen.dart';
import '../screens/auth/sigin_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/auth/welcome_screen.dart';
import '../screens/dashboard/bartender_screen.dart';
import '../screens/dashboard/chef_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/dashboard/decor_screen.dart';
import '../screens/dashboard/entertainment_screen.dart';
import '../screens/dashboard/makeup_screen.dart';
import '../screens/dashboard/mehndi_screen.dart';
import '../screens/dashboard/pandit_screen.dart';
import '../screens/dashboard/photographer_screen.dart';
import '../screens/dashboard/valet_parking_screen.dart';
import '../screens/login/login_screen.dart';

import 'app_routes.dart';

class AppPages {
  static Route<dynamic> onGenerateRoute( settings) {
    // Define a map for screens and their corresponding BLoC classes
    final Map<String, Widget> routes = {
      AppRoutes.welcome: const WelcomeScreen(),
      AppRoutes.signIn: const SignInScreen(),
      AppRoutes.signUp: const SignupScreen(),
      AppRoutes.home: const HomeScreen(),
      AppRoutes.otpVerification: const OtpVerificationScreen(),
      AppRoutes.dashboard: DashboardScreen(),
      AppRoutes.photographer: PhotographerScreen(),
      AppRoutes.viewAllPackages: ViewAllPackages(),
      AppRoutes.photoAndVideographer: PhotoAndVideographers(),
      AppRoutes.chef: ChefScreen(),
      AppRoutes.bartender: BartenderScreen(),
      AppRoutes.makeup: MakeupScreen(),
      AppRoutes.entertainment: EntertainmentScreen(),
      AppRoutes.mehndi: MehndiScreen(),
      AppRoutes.decor: DecorScreen(),
      AppRoutes.pandit: PanditScreen(),
      AppRoutes.valet: ValetParkingScreen(),
      AppRoutes.einvitation: EInvitationScreen(),
      AppRoutes.account: AccountScreen(),
      AppRoutes.entertainmentAllDetails: EntertainmentAllDetailsScreen(),
      AppRoutes.bookPhotographService: PhotographBookServiceScreen(),
      AppRoutes.entertainmentSubServices: EntertainmentAllServicesSubList(),
      AppRoutes.entertainmentBookServiceScreen: EntertainmentBookServiceScreen(),
      // AppRoutes.login: LoginScreen(),
      AppRoutes.services: ServicesScreen(),
      AppRoutes.concepts: ConceptsScreen(),
      AppRoutes.event:EventScreen(),
      AppRoutes.Subcategory: SubcategoryScreen(),
      AppRoutes.EventDetail: EventDetailsScreen(serviceId: '',),

    };

    // Define a map for the corresponding BLoC classes
    final Map<String, Bloc> blocs = {
      AppRoutes.dashboard: DashboardBloc(),
      AppRoutes.photographer: PhotographerBloc(),
      AppRoutes.viewAllPackages: PhotographerBloc(),
      AppRoutes.bookPhotographService: PhotographerBloc(),
      AppRoutes.chef: ChefBloc(),
      AppRoutes.bartender: BartenderBloc(),
      AppRoutes.makeup: MakeupBloc(),
      AppRoutes.entertainment: EntertainmentBloc(),
      AppRoutes.entertainmentSubServices: EntertainmentBloc(),
      AppRoutes.entertainmentAllDetails: EntertainmentBloc(),
      AppRoutes.entertainmentBookServiceScreen: EntertainmentBloc(),
      AppRoutes.mehndi: MehndiBloc(),
      AppRoutes.decor: DecorBloc(),
      AppRoutes.pandit: PanditBloc(),
      AppRoutes.valet: ValetParkingBloc(),
      AppRoutes.einvitation: EinvitationBloc(),
      AppRoutes.account: AccountBloc(),
      AppRoutes.concepts: ConceptsBloc(),
      AppRoutes.event:EventBloc(),
      AppRoutes.Subcategory: SubcategoryBloc(),
      // AppRoutes.events: EventBloc(),
      // // Add EventBloc for eventDetails route:
      // AppRoutes.eventDetails: EventBloc(),
    };

    // Check if the route has an associated Bloc
    if (routes.containsKey(settings.name)) {
      // If the route has a BLoC, return the screen wrapped in a BlocProvider
      if (blocs.containsKey(settings.name)) {
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => blocs[settings.name]!,
            child: routes[settings.name]!,
          ),
          // Add fullscreenDialog for eventDetails popup:

        );
      } else {
        // If there is no BLoC, just return the screen directly
        return MaterialPageRoute(
          builder: (_) => routes[settings.name]!,
        );
      }
    }

    // Default route for undefined paths
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('Page not found')),
      ),
    );
  }
}