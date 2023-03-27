import 'package:flutter/material.dart';
import 'package:app_name_package/global/global_media.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: GlobalMedia.width,
      height: GlobalMedia.height,
      child: const Center(
        child: Text(
          'Splash',
        ),
      ),
    );
  }
}
