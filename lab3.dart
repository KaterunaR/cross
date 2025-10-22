class Session {
  String _date;
  String _topic;
  int _participants;

  Session(this._date, this._topic, this._participants);

  String get date => _date;
  String get topic => _topic;
  int get participants => _participants;

  set date(String value) => _date = value;
  set topic(String value) => _topic = value;
  set participants(int value) => _participants = value;
}

class Conference {
  String _name;
  String _location;
  Map<int, Session> _sessions = {}; 

  Conference(this._name, this._location);

  String get name => _name;
  String get location => _location;

  set name(String value) => _name = value;
  set location(String value) => _location = value;

  // add session
  void addSession(int id, Session session) {
    _sessions[id] = session;
  }

  void showStatistics() {
    if (_sessions.isEmpty) {
      print('Засідань не знайдено!');
      return;
    }

    int totalParticipants = 0;
    Session minParticipantsSession = _sessions.values.first;
    Session longestTopicSession = _sessions.values.first;

    _sessions.forEach((id, session) {
      totalParticipants += session.participants;

      print('Було додано нове засіданні ${session.topic}. Дата: ${session.date}');

      if (session.participants < minParticipantsSession.participants) {
        minParticipantsSession = session;
      }

      if (session.topic.length > longestTopicSession.topic.length) {
        longestTopicSession = session;
      }
    });

    int average = totalParticipants ~/ _sessions.length;


    print("------------------------------------------------------");
    print('Конференція: $_name   Локація: $_location');
    print('Середня кількість учасників на засіданні: ${average}');
    print('Засідання з найменшою кількістю учасників: ${minParticipantsSession.topic} (${minParticipantsSession.participants} participants)');
    print('Тема з найдовшою назвою: ${longestTopicSession.topic} (${longestTopicSession.participants} participants)');
    print("------------------------------------------------------");
  }
}

void main() {
  Conference conf = Conference('Нова конференція', 'Львів');

  conf.name = 'Осіння конференція';

  conf.addSession(1, Session('2025-10-01', 'Розвиток ШІ', 40));
  conf.addSession(2, Session('2025-10-02', 'Підсумок місяця', 30));
  conf.addSession(3, Session('2025-10-03', 'Фінанси', 12));
  conf.addSession(4, Session('2025-10-04', 'Тренди', 25));

  conf.showStatistics();
}
