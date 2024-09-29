class FilePath {
  late int _id;
  late String _name;
  late String _path;
  late int _videosId;

  FilePath.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'] ?? "";
    _path = json['path'] ?? "";
    _videosId = json['videosId'];
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'FilePath{_id: $_id, _name: $_name, _path: $_path, _videosId: $_videosId}';
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get path => _path;

  set path(String value) {
    _path = value;
  }

  int get videosId => _videosId;

  set videosId(int value) {
    _videosId = value;
  }
}
