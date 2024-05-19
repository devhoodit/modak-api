import 'package:modak/src/api/errors.dart';

/// validate [offset] and [limit] is in condition
/// [offset] >=0 and 0 < [limit] <= maxlimit
/// if not validate throw [InvalidInputError] with description
void validateRange(int offset, int limit, int maxLimit) {
  if (offset < 0 || limit < 1 || limit > maxLimit) {
    throw InvalidInputRangeError(offset, limit, maxLimit);
  }
}
