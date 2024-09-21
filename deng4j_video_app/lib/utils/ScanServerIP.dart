import 'package:douyin_app/data/Instance.dart';
import 'package:douyin_app/utils/IpV4AndIpV6Tool.dart';

Future<String> scanServerIP() async {
  var localIP = await getLocalIpAddress();
  Instance.serverHost = localIP!;
  print("----------------------本地ip：" + localIP!);
  return localIP;
}
