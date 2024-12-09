import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:screenshot_image/screenshot_image.dart';

import 'screenshot_image_platform_interface.dart';

/// An implementation of [ScreenshotImagePlatform] that uses method channels.
class MethodChannelScreenshotImage extends ScreenshotImagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screenshot_image');

  @override
  Future<bool> screenshotOff() async {
    final result = await methodChannel.invokeMethod<bool>(screenShotOffConst);
    return result ?? false;
  }

  @override
  Future<bool> screenshotOn() async {
    final result = await methodChannel.invokeMethod<bool>(screenShotOnConst);
    return result ?? false;
  }
}
