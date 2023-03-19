import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shushook_front_new/global/global_key.dart';
import 'package:shushook_front_new/routes/app_pages.dart';
import 'package:shushook_front_new/services/dynamic_link_service.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  runApp(const MyApp());
}

Future<void> init() async {
  // 초반 초기화
  await Future.value([
    WidgetsFlutterBinding.ensureInitialized(),
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SchedulerBinding.instance.scheduleWarmUpFrame();
    }),

    timeago.setLocaleMessages('ko', timeago.KoMessages()),

    // .env 불러오기
    await dotenv.load(fileName: "secret.env"),

    // 가로모드 방지
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),

    Get.put(DynamicLinkService(), permanent: true),
  ]);

  DynamicLinkService.to.setDynamic();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return OKToast(
          child: GetMaterialApp(
            title: 'AppName',
            navigatorKey: GlobalVariable.navigatorState,
            initialRoute: Pages.INITIAL,
            getPages: Pages.routes,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          ),
        );
      }
    );
  }
}
