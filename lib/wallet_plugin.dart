import 'wallet_plugin_platform_interface.dart';

class WalletPlugin {
  Future<String?> getPlatformVersion() {
    return WalletPluginPlatform.instance.getPlatformVersion();
  }

  Future<String?> getMnemonic() {
    return WalletPluginPlatform.instance.getMnemonic();
  }
}
