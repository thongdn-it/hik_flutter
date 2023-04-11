import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hik_flutter/hik_flutter_method_channel.dart';

void main() {
  MethodChannelHikFlutter platform = MethodChannelHikFlutter();
  const MethodChannel channel = MethodChannel('hik_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
