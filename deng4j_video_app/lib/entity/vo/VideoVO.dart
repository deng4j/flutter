class VideoVO {
  late int id;
  late String name;
  late String number;
  late int categoryId;
  late DateTime releaseDate;
  late String imageUrl;

  VideoVO(this.id, this.name, this.number, this.categoryId, this.releaseDate,
      this.imageUrl);

  VideoVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']?? "";
    number = json['number']?? "";
    categoryId = json['categoryId'];
    releaseDate = json['releaseDate']?? DateTime.now();
    imageUrl = json['imageUrl']?? "";
  }

  @override
  String toString() {
    return 'VideoVO{id: $id, name: $name, number: $number, categoryId: $categoryId, releaseDate: $releaseDate, imageUrl: $imageUrl}';
  }
}
