class CollectionBox<T> {
  Map<int, T> items = {};

  void addItem(int id, T item) {
    items[id] = item;
  }

  T? getItem(int id) => items[id];
}

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


Future<int> averageParticipantsAsync<T extends Session>(Map<int, T> sessions) {
  if (sessions.isEmpty) return Future.value(0);

  int total = 0;
  for (var session in sessions.values) {
    total += session.participants;
  }

  return Future.value(total ~/ sessions.length);
}

Future<T?> minParticipantsSessionAsync<T extends Session>(Map<int, T> sessions) {
  return Future(() {
    if (sessions.isEmpty) return null;
    T minSession = sessions.values.first;
    for (var session in sessions.values) {
      if (session.participants < minSession.participants) {
        minSession = session;
      }
    }
    return minSession;
  });
}

Future<T?> longestTopicSessionAsync<T extends Session>(Map<int, T> sessions) {
  return Future(() {
    if (sessions.isEmpty) return null;
    T longestSession = sessions.values.first;
    for (var session in sessions.values) {
      if (session.topic.length > longestSession.topic.length) {
        longestSession = session;
      }
    }
    return longestSession;
  });
}


class Conference {
  String _name;
  String _location;
  CollectionBox<Session> sessions = CollectionBox<Session>();

  Conference(this._name, this._location);

  String get name => _name;
  String get location => _location;

  set name(String value) => _name = value;
  set location(String value) => _location = value;

  void addSession(int id, Session session) {
    sessions.addItem(id, session);
    print('Додано засідання: ${session.topic}, дата: ${session.date}');
  }

  Future<void> showAsyncStatistics() async {
    try {
      if (sessions.items.isEmpty) {
        print('Засідань не знайдено!');
        return;
      }

      int avg = await averageParticipantsAsync(sessions.items);
      print('Розрахунок середньої кількості учасників...');
      await Future.delayed(Duration(seconds: 3));

      Session? minSession = await minParticipantsSessionAsync(sessions.items);
      print('Пошук засідання з найменшою кількості учасників...');
      await Future.delayed(Duration(seconds: 3));
      
      Session? longestTopic = await longestTopicSessionAsync(sessions.items);
      print('Пошук теми з найдовшою назвою...');
      await Future.delayed(Duration(seconds: 3));

      print("------------------------------------------------------");
      print('Конференція: $name   Локація: $location');
      print('Середня кількість учасників на засіданні: $avg');
      print(
          'Засідання з найменшою кількістю учасників: ${minSession?.topic} (${minSession?.participants})');
      print(
          'Тема з найдовшою назвою: ${longestTopic?.topic}');
      print("------------------------------------------------------");
    } catch (e) {
      print('Сталася помилка при отриманні статистики: $e');
    }
  }

}


void main() async{
  Conference conf = Conference('Нова конференція', 'Львів');
  conf.name = 'Осіння конференція';

  conf.addSession(1, Session('2025-10-01', 'Розвиток ШІ', 40));
  conf.addSession(2, Session('2025-10-02', 'Підсумок місяця', 30));
  conf.addSession(3, Session('2025-10-03', 'Фінанси', 12));
  conf.addSession(4, Session('2025-10-04', 'Тренди', 25));

  await conf.showAsyncStatistics();
}
