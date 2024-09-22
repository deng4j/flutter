import 'package:dio/dio.dart';
import 'package:douyin_app/configs/DioConfig.dart';
import 'package:douyin_app/entity/dto/CategoryDTO.dart';

Future<List<CategoryDTO>> getCategoryDTO() async {
  List<CategoryDTO> categoryDTOList = [];
  try {
    Response response = await DioUtils.getDio().get("/videos/initCategoryData");
    var data = response.data;
    data.forEach((e) {
      categoryDTOList.add(CategoryDTO.fromJson(e));
    });
    print(categoryDTOList);
    return categoryDTOList;
  } catch (e) {
    print("/videos/initCategoryData："+e.toString());
  }
  return categoryDTOList;
}
