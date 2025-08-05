class PaginationResponse<T> {
  PaginationResponse();
  factory PaginationResponse.fromJson(
    Map<dynamic, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return PaginationResponse<T>()
      ..count = json['data']['total'] as num
      // ..next = json['data']['next_page_url'] as String
      // ..previous = json['data']['prev_page_url'] as String
      ..results = (json['data']['data'] as List<Object?>)
          .map((e) => fromJsonT(e))
          .toList();
  }
  late num count;
  // late String next;
  // late String previous;
  late List<T> results;

// next: $next, previous: $previous,
  // @override
  // String toString() {
  //   return '''PaginationModel<$T>(count: $count,  results: $results)''';
  // }
}
