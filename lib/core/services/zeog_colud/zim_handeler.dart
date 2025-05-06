import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zego_zim/zego_zim.dart';

class ZegoZIMEventHandler extends ZIMEventHandler {
  final BuildContext context;

  ZegoZIMEventHandler(this.context);

  @override
  void onReceiveRoomMessage(
    ZIM zim,
    String roomID,
    List<ZIMMessage> messageList,
  ) {
    for (var msg in messageList) {
      try {
        final data = jsonDecode((msg as ZIMTextMessage).message);
        if (data['type'] == 'gift') {
          final from = data['from'];
          final to = data['to'];
          final gift = data['gift'];
          final giftName = data['giftName'];
          final value = data['value'];

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('🎁 $from أرسل $giftName ($gift) إلى $to'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.purple.shade300,
            ),
          );
        }
      } catch (e) {
        print('📛 Error parsing gift: $e');
      }
    }
  }
}
