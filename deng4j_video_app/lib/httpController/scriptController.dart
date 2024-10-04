import 'package:dio/dio.dart';
import 'package:douyin_app/configs/DioConfig.dart';

Future<String> initPath() async {
  String code = "";
  String msg = "";
  try {
    String url = "/script/initPath";
    Response response = await DioUtils.getDio().get(url);
    var data = response.data;
    code = data["code"].toString();
    msg = data["msg"].toString();
    print(data);
    return msg;
  } catch (e) {
    print(e);
  }
  return msg;
}
