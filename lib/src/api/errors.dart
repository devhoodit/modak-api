class InvalidInputError implements Exception {
  final String message;
  InvalidInputError(this.message);
}

class InvalidInputRangeError extends InvalidInputError {
  final int actualOffset;
  final int actualLimit;
  final int maxLimit;
  InvalidInputRangeError(this.actualOffset, this.actualLimit, this.maxLimit)
      : super(
            "offset: $actualOffset, limit: $actualLimit, expected value offset >= 0, 1 <= limit <= $maxLimit");
}
