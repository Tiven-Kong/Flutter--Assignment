class CustomDuration {
  final int _milliseconds;
  CustomDuration._(this._milliseconds)
      : assert(_milliseconds >= 0, 'Duration cannot be negative');
  factory CustomDuration.fromHours(int hours) {
    return CustomDuration._(hours * 60 * 60 * 1000);
  }
  factory CustomDuration.fromMinutes(int minutes) {
    return CustomDuration._(minutes * 60 * 1000);
  }
  factory CustomDuration.fromSeconds(int seconds) {
    return CustomDuration._(seconds * 1000);
  }
  bool operator >(CustomDuration other) {
    return _milliseconds > other._milliseconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration._(_milliseconds + other._milliseconds);
  }

  CustomDuration operator -(CustomDuration other) {
    int result = _milliseconds - other._milliseconds;
    return CustomDuration._(result >= 0 ? result : 0);
  }

  int get inMilliseconds => _milliseconds;
  int get inSeconds => _milliseconds ~/ 1000;
  int get inMinutes => _milliseconds ~/ (60 * 1000);
  int get inHours => _milliseconds ~/ (60 * 60 * 1000);
}

void main() {
  var duration1 = CustomDuration.fromHours(2);
  var duration2 = CustomDuration.fromMinutes(90);
  print(duration1 > duration2);
  var totalDuration = duration1 + duration2;
  print(totalDuration.inHours);
  var remainingDuration = duration1 - duration2;
  print(remainingDuration.inMinutes);
}
