import 'package:get/get.dart';
import 'package:app_name_package/pages/onboarding/bindings/splash_binding.dart';
import 'package:app_name_package/pages/onboarding/views/splash_view.dart';
import 'package:app_name_package/routes/app_routes.dart';

class Pages {
  Pages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      title: '스플래시',
      name: INITIAL,
      page: () => const SplashView(),
      bindings: [
        SplashBinding(),
      ],
      transition: Transition.native,
      popGesture: false,
    ),
  ];
}