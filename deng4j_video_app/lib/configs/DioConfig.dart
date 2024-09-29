// 或者通过传递一个 `options`来创建dio实例
import 'package:dio/dio.dart';
import 'package:douyin_app/data/Instance.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 在请求发送前执行的操作
    print("Sending request to ${options.uri}");
    // 可以在这里添加自定义的请求头等
    options.headers["Custom-Header"] = "value";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 在接收响应后执行的操作
    print("Received response from ${response.requestOptions.uri}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    // 在请求失败时执行的操作
    // 检查错误类型
    switch (error.type) {
      case DioExceptionType.cancel:
        // 处理连接超时错误
        break;
      case DioExceptionType.sendTimeout:
        // 处理发送超时错误
        break;
      case DioExceptionType.receiveTimeout:
        // 处理接收超时错误
        break;
      case DioExceptionType.badResponse:
        // 处理由服务器返回的错误状态码，如404、500等
        if (error.response?.statusCode == 404) {
          // 处理404错误
        }
        break;
      case DioExceptionType.unknown:
        // 处理其他错误，如无网络连接
        break;
      case DioExceptionType.connectionTimeout:
        // 客户端在与服务器建立连接时超出指定的时间限制
        break;
      case DioExceptionType.badCertificate:
        // 处理服务器的 SSL 证书不被客户端信任
        break;
      case DioExceptionType.connectionError:
        // 处理由于网络连接问题失败
        break;
    }
    // 使用handler.next继续传递错误
    return handler.next(error);
  }
}

class DioUtils {
  static Dio _dio = new Dio();

  static DioUtils? _dioUtils;

  DioUtils() {
    String serverHost = Instance.serverHost;
    BaseOptions options = BaseOptions(
      baseUrl: "http://$serverHost:8080/",
      connectTimeout: Duration(seconds: 180),
      receiveTimeout: Duration(seconds: 180),
    );
    _dio = new Dio(options);

    // 将自定义拦截器添加到Dio实例
    _dio.interceptors.add(CustomInterceptor());
  }

  static Dio getDio() {
    if (null == _dioUtils) _dioUtils = new DioUtils();
    return _dio;
  }
}
