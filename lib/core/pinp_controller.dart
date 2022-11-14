import 'package:flutter/services.dart';

/// PinP を操作するためのコントローラ
class PinPController {
  PinPController();

  final _channel =
      const MethodChannel('jp.kshiro.resteye.flutterResteye/sample');

  // アセットを設定する
  Future<void> setAsset(int assetNumber) async {
    await _channel.invokeMethod('setAsset', assetNumber);
  }

  Future<void> toggle() async {
    await _channel.invokeMethod('toggle');
  }

  /// PinP がアクティブかどうかをチェックする
  Future<bool> isPictureInPictureActive() async {
    return await _channel.invokeMethod<bool>('isPictureInPictureActive') ??
        false;
  }
}
