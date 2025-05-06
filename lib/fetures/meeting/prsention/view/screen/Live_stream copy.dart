import 'package:flutter/material.dart';
import 'package:malab/core/services/zeog_colud/zego_cloud_ser.dart';
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
  void initState() {
    super.initState();

    ZegoLiveStreamService().initialize(
      userName: widget.userName,
      liveID: '123',
      isHost: widget.id == "1",
    );
  }

  @override
  Widget build(BuildContext context) {
    final service = ZegoLiveStreamService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ZegoUIKitPrebuiltLiveStreaming(
        appID: service.appID,
        appSign: service.appSign,
        userID: service.userID,
        userName: service.userName,
        liveID: service.liveID,
        config: service.config,
      ),
    );
  }
}
