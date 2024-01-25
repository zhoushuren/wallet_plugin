import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wallet_plugin_method_channel.dart';

abstract class WalletPluginPlatform extends PlatformInterface {
  /// Constructs a WalletPluginPlatform.
  WalletPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static WalletPluginPlatform _instance = MethodChannelWalletPlugin();

  /// The default instance of [WalletPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelWalletPlugin].
  static WalletPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WalletPluginPlatform] when
  /// they register themselves.
  static set instance(WalletPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getMnemonic() {
    throw UnimplementedError('getMnemonic() has not been implemented.');
  }
}
