import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'hik_flutter_method_channel.dart';

abstract class HikFlutterPlatform extends PlatformInterface {
  /// Constructs a HikFlutterPlatform.
  HikFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static HikFlutterPlatform _instance = MethodChannelHikFlutter();

  /// The default instance of [HikFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelHikFlutter].
  static HikFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HikFlutterPlatform] when
  /// they register themselves.
  static set instance(HikFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
