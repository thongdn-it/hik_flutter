
import 'hik_flutter_platform_interface.dart';

class HikFlutter {
  Future<String?> getPlatformVersion() {
    return HikFlutterPlatform.instance.getPlatformVersion();
  }
}
