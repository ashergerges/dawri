import 'package:async/async.dart';

extension FoldResult<T> on Result<T> {
  R fold<R>(R Function(Object error) onError, R Function(T data) onSuccess) {
    if (asValue?.value != null) {
      return onSuccess(asValue!.value);
    } else {
      return onError(asError?.error ?? "Problem occurred");
    }
  }
}
