import 'package:shushook_front_new/global/global_key.dart';

class MediaData {
  final double width;
  final double height;

  MediaData({
    required this.width,
    required this.height,
  });
}

class GlobalMedia {
  static final data = _initData();

  static MediaData _initData() {
    final context = GlobalVariable.navigatorState.currentContext;
    return MediaData(
      width: context!.size!.width,
      height: context.size!.height,
    );
  }

  static double get width => data.width;
  static double get height => data.height;
}
