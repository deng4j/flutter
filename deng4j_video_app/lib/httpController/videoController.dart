import 'package:dio/dio.dart';
import 'package:douyin_app/configs/DioConfig.dart';
import 'package:douyin_app/entity/dto/VideoDetailDTO.dart';
import 'package:douyin_app/entity/vo/VideoVO.dart';

Future<List<VideoVO>> searchList(
    int currentPage, int pageSize,String categoryId, String content) async {
  List<VideoVO> videoVOList = [];
  try {
    String baseUrl =
        "/videos/searchList?currentPage=$currentPage&pageSize=$pageSize&content=$content&categoryId=$categoryId";
    Response response = await DioUtils.getDio().get(baseUrl);
    var data = response.data;
    data.forEach((e) {
      videoVOList.add(VideoVO.fromJson(e));
    });
    print(response);
    return videoVOList;
  } catch (e) {
    print(e);
  }
  return videoVOList;
}

Future<VideoDetailDTO> getVideoDetailById(int id) async {
  late VideoDetailDTO videoDetailDTO = VideoDetailDTO();
  try {
    String url = "/videos/$id";
    Response response = await DioUtils.getDio().get(url);
    var data = response.data;
    videoDetailDTO = VideoDetailDTO.fromJson(data);
    print(videoDetailDTO);
    return videoDetailDTO;
  } catch (e) {
    print(e);
  }
  return videoDetailDTO;
}
