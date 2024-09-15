/**
 * 分类实体
 */
class Category {
  late int _id;
  late String _name;

  Category(this._id, this._name);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return 'Category{_id: $_id, _name: $_name}';
  }
}