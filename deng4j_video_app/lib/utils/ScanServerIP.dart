import 'package:douyin_app/data/Instance.dart';
import 'package:douyin_app/utils/IpV4AndIpV6Tool.dart';

Future<void> scanServerIP() async {
  var localIP = await getLocalIpAddress();
  Instance.serverHost = localIP!;
  print("----------------------ip：" + localIP!);
}
