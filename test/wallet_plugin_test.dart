import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:wallet_plugin/wallet_plugin.dart';
import 'package:wallet_plugin/wallet_plugin_method_channel.dart';
import 'package:wallet_plugin/wallet_plugin_platform_interface.dart';

class MockWalletPluginPlatform
    with MockPlatformInterfaceMixin
    implements WalletPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getMnemonic() {
    // TODO: implement getMnemonic
    throw UnimplementedError();
  }
}

void main() {
  final WalletPluginPlatform initialPlatform = WalletPluginPlatform.instance;

  test('$MethodChannelWalletPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWalletPlugin>());
  });

  test('getPlatformVersion', () async {
    WalletPlugin walletPlugin = WalletPlugin();
    MockWalletPluginPlatform fakePlatform = MockWalletPluginPlatform();
    WalletPluginPlatform.instance = fakePlatform;

    expect(await walletPlugin.getPlatformVersion(), '42');
  });
}
