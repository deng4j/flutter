import 'package:dio/dio.dart';
import 'package:douyin_app/configs/DioConfig.dart';
import 'package:douyin_app/entity/dto/VideoDTO.dart';

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
