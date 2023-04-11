import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'hik_flutter_platform_interface.dart';

/// An implementation of [HikFlutterPlatform] that uses method channels.
class MethodChannelHikFlutter extends HikFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('hik_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
