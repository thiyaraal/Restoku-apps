abstract class SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Map<String, dynamic>> searchResults;
  SearchSuccess(this.searchResults);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}

class SearchEmpty extends SearchState {}