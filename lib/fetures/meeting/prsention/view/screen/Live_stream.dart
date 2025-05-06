import 'dart:math';

import 'package:flutter/material.dart';
import 'package:malab/core/services/zeog_colud/zeg_config.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveStrem extends StatefulWidget {
  const LiveStrem({Key? key, required this.id, required this.userName})
      : super(key: key);
  final String id;
  final String userName;
  @override
  State<LiveStrem> createState() => _LiveStremState();
}

class _LiveStremState extends State<LiveStrem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ZegoUIKitPrebuiltLiveStreaming(
        appID: ZegConfig().appId, // your AppID,
        appSign: ZegConfig().appSig,
        userID: Random().nextInt(1000000).toString(),

        userName: widget.userName,
        liveID: '123',
        config: widget.id == "1"
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
// Let's run it on a real device and see :)
