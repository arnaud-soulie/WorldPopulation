import 'datas.dart';

class WorldPopCalculator {
  int _secondsSinceStartOfYear, _totalSecondsInCurrentYear, _deltaPop;
  DateTime _now;
  int _baseYear;

  WorldPopCalculator() {
    refreshData();
  }

  void refreshData() {
    this._now = DateTime.now();
    this._baseYear = _beforeFirstJuly() ? _now.year - 1 : _now.year;
    if (worldPopTotal[_baseYear] != null) {
      this._secondsSinceStartOfYear = _getSecondsSinceBaseYear();
      this._totalSecondsInCurrentYear = _getTotalSecondsInCurrentYear();
      this._deltaPop = _getCurrentYearDeltaPop();
    }
  }

  int _getSecondsSinceBaseYear() {
    var begYear = DateTime(this._baseYear, 7, 1, 0, 0, 0, 0);
    return begYear.difference(this._now).inSeconds.abs();
  }

  int _getCurrentYearDeltaPop() {
    int thisYearPop = worldPopTotal[_baseYear];
    int nextYearPop = worldPopTotal[_baseYear + 1];
    return nextYearPop - thisYearPop;
  }

  int _getTotalSecondsInCurrentYear() {
    return DateTime(_baseYear + 1, 7, 1, 0, 0, 0, 0)
        .difference(DateTime(_baseYear, 7, 1, 0, 0, 0, 0))
        .inSeconds
        .abs();
  }

  bool _beforeFirstJuly() => _now.month < 7 ? true : false;

  double getTotalPopulation() {
    refreshData();
    if (this._secondsSinceStartOfYear != null) {
      return worldPopTotal[_baseYear] +
          (_deltaPop / _totalSecondsInCurrentYear) * _secondsSinceStartOfYear;
    }
  }
}
