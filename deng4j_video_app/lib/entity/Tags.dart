class Tags {
  late int _id;
  late String _name;
  late int _videosId;

  Tags.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'] ?? "";
    _videosId = json['videosId'];
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }


  @override
  String toString() {
    return 'Tags{_id: $_id, _name: $_name, _videosId: $_videosId}';
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get videosId => _videosId;

  set videosId(int value) {
    _videosId = value;
  }
}
