import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:uni_links/uni_links.dart';

// import '../modules/main/controllers/main_controllers.dart';
// import '../routes/app_pages.dart';
// import 'auth_service.dart';
// import 'data_service.dart';

class DynamicLinkService extends GetxService {
  static DynamicLinkService get to => Get.find();

  Future<bool> setDynamic() async {
    bool isExistDynamicLink = await _getInitialDynamicLink();
    _addListener();

    return isExistDynamicLink;
  }

  Future<bool> _getInitialDynamicLink() async {
    final String? deepLink = await getInitialLink();

    if (deepLink != null) {
      PendingDynamicLinkData? dynamicLinkData = await FirebaseDynamicLinks
          .instance
          .getDynamicLink(Uri.parse(deepLink));

      if (dynamicLinkData != null) {
        _redirectScreen(dynamicLinkData);

        return true;
      }
    }

    return false;
  }

  void _addListener() {
    FirebaseDynamicLinks.instance.onLink.listen((
      PendingDynamicLinkData dynamicLinkData,
    ) {
      _redirectScreen(dynamicLinkData);
    }).onError((error) {
      Logger().e(error);
    });
  }

  void _redirectScreen(PendingDynamicLinkData dynamicLinkData) async {
    Logger().d(dynamicLinkData);

    if (dynamicLinkData.link.queryParameters.containsKey('id')) {
      String bottomNavigation = dynamicLinkData.link.path
          .split('/')[dynamicLinkData.link.path.split('/').length - 2];
      String content = dynamicLinkData.link.path.split('/').last;
      String id = dynamicLinkData.link.queryParameters['id']!;

      switch (bottomNavigation) {
        case 'route path':
          break;
      }

      // if (!AuthService.to.isLogin.value) {
      //   await Get.toNamed(Routes.SIGNIN);
      // }

      // 이동 로직
    }
  }

  void pushRedirectScreen(dynamic message) async {
    Logger().d(message);

    // String bottomNavigation = message['path'].split('/')[1];

    // switch (bottomNavigation) {
    //   case 'route':
    //     break;
    // }

    // if (!AuthService.to.isLogin.value) {
    //   await Get.toNamed(Routes.SIGNIN);
    // }

    Get.toNamed('path', arguments: {'id': 'id'});
  }

  Future<String> getShortLink(String route, String parameter) async {
    final dynamicLinkParams = DynamicLinkParameters(
      uriPrefix: 'base_link',
      link: Uri.parse(
          'base_link/$route?parameter=$parameter'),
      androidParameters: const AndroidParameters(
        packageName: '',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: '',
        appStoreId: '',
        minimumVersion: '0',
      ),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    Logger().d(dynamicLink.shortUrl.toString());
    return dynamicLink.shortUrl.toString();
  }
}
