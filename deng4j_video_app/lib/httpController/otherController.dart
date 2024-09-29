import 'dart:convert';
import 'dart:io';

Future<String> getServerIP(String ip) async {
  String data = "";
  try {
    var uri = Uri.parse("http://$ip:8080/script/getServerIP");
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(uri);
    // 关闭请求，等待响应
    var response = await request.close();
    // 解码响应的内容
    String data = await response.transform(utf8.decoder).join();
    print(data);
    return data;
  } catch (e) {
    print(e);
  }
  return data;
}
