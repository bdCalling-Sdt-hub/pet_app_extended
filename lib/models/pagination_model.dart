class Pagination {
  final int limit;
  final int currentPage;
  final int totalPages;
  final int totalCount;

  Pagination({
    required this.limit,
    required this.currentPage,
    required this.totalPages,
    required this.totalCount,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      limit: json['limit'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      totalCount: json['totalCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'currentPage': currentPage,
      'totalPages': totalPages,
      'totalCount': totalCount,
    };
  }
}
