// lib/features/help_center/data/repositories/interfaces/i_help_center_repository.dart
import 'package:async/async.dart';
import 'package:dawri/features/help_center/data/models/help_center_model.dart';

abstract class IHelpCenterRepository {
  Future<Result<List<FaqCategoryModel>>> getCategories();

  /// [categoryId] narrows the list server-side; omitted means "all".
  Future<Result<List<FaqModel>>> getFaqs({int? categoryId});
}
