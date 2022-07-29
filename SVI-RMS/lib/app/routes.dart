import 'package:flutter/material.dart';
import 'package:sv_rms_mobile/ui/add_technician/add_technician_screen.dart';
import 'package:sv_rms_mobile/ui/authentication/login_screen.dart';
import 'package:sv_rms_mobile/ui/authentication/profile_setup/demo.dart';
import 'package:sv_rms_mobile/ui/authentication/profile_setup/multi_step_form.dart';
import 'package:sv_rms_mobile/ui/authentication/signup_screen.dart';
import 'package:sv_rms_mobile/ui/complaints/complaints_screen.dart';
import 'package:sv_rms_mobile/ui/complaints/file_complaint_screen.dart';
import 'package:sv_rms_mobile/ui/home/home_screen.dart';
import 'package:sv_rms_mobile/ui/home/home_store.dart';
import 'package:sv_rms_mobile/ui/how_it_works/how_it_works_screen.dart';
import 'package:sv_rms_mobile/ui/invoices/invoices_screen.dart';
import 'package:sv_rms_mobile/ui/invoices/invoices_store.dart';
import 'package:sv_rms_mobile/ui/payment_details/payment_details_screen.dart';
import 'package:sv_rms_mobile/ui/profile_details/about_me/about_me_screen.dart';
import 'package:sv_rms_mobile/ui/settings/settings_screen.dart';
import 'package:sv_rms_mobile/ui/splash_screen/splash_screen.dart';
import 'package:sv_rms_mobile/ui/technicians/technician_screen.dart';
import 'package:sv_rms_mobile/ui/technicians/technician_store.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.route:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case Demo.route:
      return MaterialPageRoute(
        builder: (context) => const Demo(),
      );
    case LoginScreen.route:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case SignupScreen.route:
      return MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      );
    case HomeScreen.route:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(
          homeScreenStore: HomeScreenStore(),
        ),
      );
    case MultiStepForm.route:
      return MaterialPageRoute(
        builder: (context) => const MultiStepForm(),
      );
    // case ProjectDetailsScreen.route:
    //   return MaterialPageRoute(
    //     builder: (context) => const ProjectDetailsScreen(),
    //   );

    case InvoicesScreen.route:
      return MaterialPageRoute(
        builder: (context) => InvoicesScreen(
          store: InvoicesScreenStore(),
        ),
      );
    case TechniciansScreen.route:
      return MaterialPageRoute(
        builder: (context) => TechniciansScreen(
          store: TechniciansScreenStore(),
        ),
      );
    case AddTechniciansScreen.route:
      return MaterialPageRoute(
        builder: (context) => const AddTechniciansScreen(),
      );
    case ComplaintsScreen.route:
      return MaterialPageRoute(
        builder: (context) => const ComplaintsScreen(),
      );
    case FileComplaintScreen.route:
      return MaterialPageRoute(
        builder: (context) => const FileComplaintScreen(),
      );
    // case TechnicianDetailsScreen.route:
    //   return MaterialPageRoute(
    //     builder: (context) => const TechnicianDetailsScreen(),
    //   );
    // case BidNowScreen.route:
    //   return MaterialPageRoute(
    //     builder: (context) => const BidNowScreen(),
    //   );
    case PaymentDetailsScreen.route:
      return MaterialPageRoute(
        builder: (context) => const PaymentDetailsScreen(),
      );
    case HowItWorksScreen.route:
      return MaterialPageRoute(
        builder: (context) => const HowItWorksScreen(),
      );
    case SettingsScreen.route:
      return MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      );

    case AboutMeScreen.route:
      return MaterialPageRoute(
        builder: (context) => const AboutMeScreen(),
      );
    // case MyAttachmentsScreen.route:
    // return MaterialPageRoute(
    //   builder: (context) =>  const MyAttachmentsScreen(),
    // );
    // case MyPaymentsScreen.route:
    //   return MaterialPageRoute(
    //     builder: (context) => const MyPaymentsScreen(),
    //   );
    // case MyToolsScreen.route:
    // return MaterialPageRoute(
    //   builder: (context) => const MyToolsScreen(),
    // );
    // case OthersScreen.route:
    //   return MaterialPageRoute(
    //     builder: (context) => const OthersScreen(),
    //   );

    default:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(
          homeScreenStore: HomeScreenStore(),
        ),
      );
  }
}
