import 'package:flutter_test/flutter_test.dart';
import 'package:hik_flutter/hik_flutter.dart';
import 'package:hik_flutter/hik_flutter_platform_interface.dart';
import 'package:hik_flutter/hik_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHikFlutterPlatform
    with MockPlatformInterfaceMixin
    implements HikFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HikFlutterPlatform initialPlatform = HikFlutterPlatform.instance;

  test('$MethodChannelHikFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHikFlutter>());
  });

  test('getPlatformVersion', () async {
    HikFlutter hikFlutterPlugin = HikFlutter();
    MockHikFlutterPlatform fakePlatform = MockHikFlutterPlatform();
    HikFlutterPlatform.instance = fakePlatform;

    expect(await hikFlutterPlugin.getPlatformVersion(), '42');
  });
}
