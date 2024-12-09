import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screenshot_image_method_channel.dart';

abstract class ScreenshotImagePlatform extends PlatformInterface {
  /// Constructs a ScreenshotImagePlatform.
  ScreenshotImagePlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenshotImagePlatform _instance = MethodChannelScreenshotImage();

  /// The default instance of [ScreenshotImagePlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenshotImage].
  static ScreenshotImagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenshotImagePlatform] when
  /// they register themselves.
  static set instance(ScreenshotImagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Return `true` if screenshot capabilities has been
  /// successfully disabled or is currently disabled and `false` otherwise.
  /// throw `UnmimplementedError` if not implement
  Future<bool> screenshotOff() {
    throw UnimplementedError('screenshotOff() has not been implemented.');
  }

  /// Return `true` if screenshot capabilities has been
  /// successfully enabled or is currently enabled and `false` otherwise.
  /// throw `UnmimplementedError` if not implement
  Future<bool> screenshotOn() {
    throw UnimplementedError('screenshotOn() has not been implemented.');
  }
}
