import 'package:dio/dio.dart';
import 'package:douyin_app/configs/DioConfig.dart';
import 'package:douyin_app/entity/dto/CategoryDTO.dart';

Future<CategoryDTO> getCategoryDTO() async {
  CategoryDTO categoryDTO = new CategoryDTO();
  try {
    Response response = await DioUtils.getDio().get("/category/list");
    categoryDTO = CategoryDTO.fromJson(response.data);
    print(categoryDTO);
    return categoryDTO;
  } catch (e) {
    print(e);
  }
  return categoryDTO;
}
