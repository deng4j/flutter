class VideoSearchDTO {
  late int _currentPage;
  late int _pageSize;
  String _categoryId = "";
  String _content = "";

  VideoSearchDTO.contentSearch(
      this._currentPage, this._pageSize, this._content);

  VideoSearchDTO.categorySearch(
      this._currentPage, this._pageSize, this._categoryId);

  VideoSearchDTO.copy(VideoSearchDTO videoSearchDTO) {
    _currentPage = videoSearchDTO.currentPage;
    _pageSize = videoSearchDTO.pageSize;
    _categoryId = videoSearchDTO.categoryId;
    _content = videoSearchDTO.content;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get categoryId => _categoryId;

  set categoryId(String value) {
    _categoryId = value;
  }

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
  }

  int get pageSize => _pageSize;

  set pageSize(int value) {
    _pageSize = value;
  }

  @override
  String toString() {
    return 'VideoSearchDTO{_pageSize: $_pageSize, _currentPage: $_currentPage, _categoryId: $_categoryId, _content: $_content}';
  }
}
