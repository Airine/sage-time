class Record {
  int _id;
  int _score;
  DateTime _start;
  DateTime _end;

  Record(this._score, this._start, this._end);

  Record.map(dynamic obj) {
    this._id = obj['id'];
    this._score = obj['score'];
    this._start = obj['start'];
    this._end = obj['end'];
  }

  // Getters
  int get id => _id;

  int get score => _score;

  DateTime get start => _start;

  DateTime get end => _end;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    if (_id != null) {
      map['id'] = _id;
    }

    map['score'] = _score;
    map['start'] = _start.toIso8601String();
    map['end'] = _end.toIso8601String();

    return map;
  }

  Record.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._score = map['score'];
    this._start = DateTime.parse(map['start']);
    this._end = DateTime.parse(map['end']);
  }
}