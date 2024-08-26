class Pagination {
  final int page;
  final int limit;
  final int totalPage;
  final int total;

  Pagination({required this.page, required this.limit, required this.totalPage, required this.total});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'],
      limit: json['limit'],
      totalPage: json['totalPage'],
      total: json['total'],
    );
  }
}