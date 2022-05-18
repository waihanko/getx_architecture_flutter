class PaginationUtils {
  int _currentPage = 1;
  int? _lastPage;

  PaginationUtils();

  int get currentPage => _currentPage;

  setCurrentPage({required int? lastPage}) {
    print("Last Page is $lastPage");
    _lastPage = lastPage;
    _currentPage = _currentPage + 1;
  }

  bool isPageAvailable() {
    if(_lastPage == null) {
      return true;
    } else {
      return _currentPage <= _lastPage!;
    }
  }
}
