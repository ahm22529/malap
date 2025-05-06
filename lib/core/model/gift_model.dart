import 'dart:convert';
import 'package:zego_zim/zego_zim.dart';

class Gift {
  final String from;
  final String to;
  final String giftName;
  final String giftIcon; // مثل 🎁
  final int value;

  Gift({
    required this.from,
    required this.to,
    required this.giftName,
    required this.giftIcon,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': 'gift',
      'from': from,
      'to': to,
      'gift': giftIcon,
      'giftName': giftName,
      'value': value,
    };
  }

  // لتحويل الهديه إلى رسالة JSON قابلة للإرسال
  String toJson() {
    return jsonEncode(toMap());
  }

  // استلام الهدية من البيانات في شكل JSON
  static Gift fromJson(String jsonData) {
    final data = jsonDecode(jsonData);
    return Gift(
      from: data['from'],
      to: data['to'],
      giftName: data['giftName'],
      giftIcon: data['gift'],
      value: data['value'],
    );
  }
}
