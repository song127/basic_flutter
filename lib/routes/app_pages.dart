import 'package:get/get.dart';
import 'package:shushook_front_new/pages/onboarding/bindings/splash_binding.dart';
import 'package:shushook_front_new/pages/onboarding/views/splash_view.dart';
import 'package:shushook_front_new/routes/app_routes.dart';

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