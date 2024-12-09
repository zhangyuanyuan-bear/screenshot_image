import 'screenshot_image_platform_interface.dart';

const screenShotOnConst = "screenshotOn";
const screenShotOffConst = "screenshotOff";

class ScreenshotImage {
  final _instancePlatform = ScreenshotImagePlatform.instance;

  ScreenshotImage._();
  static ScreenshotImage get instance => ScreenshotImage._();

  Future<bool> screenshotOff() {
    return _instancePlatform.screenshotOff();
  }

  Future<bool> screenshotOn() {
    return _instancePlatform.screenshotOn();
  }
}
