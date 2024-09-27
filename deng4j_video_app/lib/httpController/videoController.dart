import 'package:dio/dio.dart';
import 'package:douyin_app/configs/DioConfig.dart';
import 'package:douyin_app/entity/dto/VideoDTO.dart';
import 'package:douyin_app/entity/vo/VideoVO.dart';

Future<VideoDTO> getVideoDTO(
    int pageSize, int currentPage, int categoryId) async {
  VideoDTO videoDTO = new VideoDTO();
  try {
    String baseUrl =
        "/videos/list?pageSize=$pageSize&currentPage=$currentPage&categoryId=$categoryId";
    Response response = await DioUtils.getDio().get(baseUrl);
    videoDTO = VideoDTO.fromJson(response.data);
    print(VideoDTO);
    return videoDTO;
  } catch (e) {
    print(e);
  }
  return videoDTO;
}

Future<List<VideoVO>> searchList(String content) async {
  List<VideoVO> videoVOList = [];
  try {
    String baseUrl = "/videos/searchList?content=$content";
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
