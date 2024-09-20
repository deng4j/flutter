import 'package:douyin_app/entity/dto/VideoDTO.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//发送get请求
Future GetVideoDTO(url) async {
  var res = await http.get(Uri.parse(url), headers: {});
  if (res.statusCode == 200) {
    var body = json.decode(res.body);
    return VideoDTO.fromJson(body);
  } else {
    return null;
  }
}
