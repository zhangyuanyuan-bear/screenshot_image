import 'package:flutter_test/flutter_test.dart';
import 'package:screenshot_image/screenshot_image.dart';
import 'package:screenshot_image/screenshot_image_platform_interface.dart';
import 'package:screenshot_image/screenshot_image_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenshotImagePlatform
    with MockPlatformInterfaceMixin
    implements ScreenshotImagePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> screenshotOff() => Future.value(true);

  @override
  Future<bool> screenshotOn() => Future.value(true);
}

void main() {
  final ScreenshotImagePlatform initialPlatform = ScreenshotImagePlatform.instance;

  test('$MethodChannelScreenshotImage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenshotImage>());
  });
}
