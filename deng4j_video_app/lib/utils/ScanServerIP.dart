import 'package:douyin_app/data/Instance.dart';
import 'package:douyin_app/httpController/otherController.dart';
import 'package:douyin_app/utils/IpV4AndIpV6Tool.dart';

Future<String> scanServerIP() async {
  String? localIP = await getLocalIpAddress();
  String? prefixIP = localIP?.substring(0, localIP.lastIndexOf(".") + 1);
  String serverHost = "";
  for (int i = 1; i < 255; i++) {
    String tempIP = prefixIP! + i.toString();
    String data = await getServerIP(tempIP);
    if ("succeed" == data) {
      serverHost = tempIP;
      Instance.serverHost = tempIP;
      break;
    }
  }
  print("----------------------本地ip：" + localIP!);
  print("----------------------服务器ip：" + serverHost);
  return serverHost;
}
