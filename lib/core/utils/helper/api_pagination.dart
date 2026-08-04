// lib/core/utils/helper/api_pagination.dart

/// Pagination block shared by the paginated list endpoints.
///
/// Hand-written on purpose: different endpoints spell the same fields
/// differently (`current_page` / `currentPage` / `page`, `last_page` /
/// `total_pages`, `has_next` / `has_more`), so every known spelling is accepted.
class ApiPagination {
  final int? currentPage;
  final int? perPage;
  final int? totalPages;
  final int? totalItems;
  final bool? hasNext;
  final bool? hasPrev;

  const ApiPagination({
    this.currentPage,
    this.perPage,
    this.totalPages,
    this.totalItems,
    this.hasNext,
    this.hasPrev,
  });

  factory ApiPagination.fromJson(Map json) => ApiPagination(
        currentPage: _asInt(json['current_page'] ?? json['currentPage'] ?? json['page']),
        perPage: _asInt(json['per_page'] ?? json['perPage'] ?? json['limit']),
        totalPages: _asInt(json['total_pages'] ?? json['totalPages'] ?? json['last_page']),
        totalItems: _asInt(json['total_items'] ?? json['totalItems'] ?? json['total']),
        hasNext: _asBool(json['has_next'] ?? json['hasNext'] ?? json['has_more']),
        hasPrev: _asBool(json['has_prev'] ?? json['hasPrev']),
      );

  /// True when another page exists. Falls back to [lastPageCount] against the
  /// requested page size when the backend omits the pagination block.
  bool hasMore({required int lastPageCount, required int limit}) {
    if (hasNext != null) return hasNext!;
    if (currentPage != null && totalPages != null) return currentPage! < totalPages!;
    return lastPageCount >= limit;
  }

  static int? _asInt(dynamic value) =>
      value is int ? value : int.tryParse('${value ?? ''}');

  static bool? _asBool(dynamic value) {
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) return value == 'true' || value == '1';
    return null;
  }
}
