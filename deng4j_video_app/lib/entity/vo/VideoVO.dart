class VideoVO {
  int? id;
  String? name;
  String? number;
  int? categoryId;
  DateTime? releaseDate;
  String? imageUrl;

  VideoVO(this.id, this.name, this.number, this.categoryId, this.releaseDate,
      this.imageUrl);

  VideoVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    categoryId = json['categoryId'];
    releaseDate = json['releaseDate'];
    imageUrl = json['imageUrl'];
  }
}
