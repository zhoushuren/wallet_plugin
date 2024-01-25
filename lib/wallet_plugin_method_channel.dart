import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wallet_plugin_platform_interface.dart';

/// An implementation of [WalletPluginPlatform] that uses method channels.
class MethodChannelWalletPlugin extends WalletPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wallet_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getMnemonic() async {
    final mnemonic = await methodChannel.invokeMethod<String>('getMnemonic');
    return mnemonic;
  }
}
