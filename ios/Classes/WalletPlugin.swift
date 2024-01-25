import Flutter
import UIKit
import Hunterwallet

public class WalletPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "wallet_plugin", binaryMessenger: registrar.messenger())
    let instance = WalletPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
      case "getMnemonic":
        let mn = generateMnemonic()
        result(mn)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    
    func generateMnemonic() -> String {
        var error: NSError?
        let mnemonic = PublicGenerateMnemonic(12, &error)

        guard error == nil else {
            return ""
        }
        return mnemonic
        
    }
}

