import 'dart:math';

import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'zeg_config.dart';

class ZegoLiveStreamService {
  static final ZegoLiveStreamService _instance =
      ZegoLiveStreamService._internal();
  factory ZegoLiveStreamService() => _instance;
  ZegoLiveStreamService._internal();

  late String _userID;
  late String _userName;
  late String _liveID;
  bool _isHost = false;

  void initialize({
    required String userName,
    required String liveID,
    required bool isHost,
  }) {
    _userID = Random().nextInt(1000000).toString();
    _userName = userName;
    _liveID = liveID;
    _isHost = isHost;
  }

  String get userID => _userID;
  String get userName => _userName;
  String get liveID => _liveID;
  bool get isHost => _isHost;

  ZegoUIKitPrebuiltLiveStreamingConfig get config {
    return _isHost
        ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
        : ZegoUIKitPrebuiltLiveStreamingConfig.audience();
  }

  int get appID => ZegConfig().appId;
  String get appSign => ZegConfig().appSig;
}
