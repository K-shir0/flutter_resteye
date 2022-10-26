import 'package:flutter/services.dart';

/// PinP を操作するためのコントローラ
class PinPController {
  PinPController();

  final _channel =
      const MethodChannel('jp.kshiro.resteye.flutterResteye/sample');

  Future<void> toggle() async {
    await _channel.invokeMethod('toggle');
  }

  /// PinP がアクティブかどうかをチェックする
  Future<bool> isPictureInPictureActive() async {
    return await _channel.invokeMethod<bool>('isPictureInPictureActive') ??
        false;
  }
}
