import 'package:eriell_company/presentation/auth/registration/registration_page.dart';
import 'package:eriell_company/presentation/auth/login/login_page.dart';
import 'package:eriell_company/presentation/home/home_page.dart';
import 'package:eriell_company/presentation/splash/splash_page.dart';
import 'package:eriell_company/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

abstract class AppPages {
  static final GoRouter router = GoRouter(
    routes: [
      /// Splash Screen
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SpalshPage(),
      ),

      /// Login Screen
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),

      /// Registration Screen
      GoRoute(
        path: Routes.registration,
        builder: (context, state) => const RegistrationPage(),
      ),

      /// Home Screen
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
