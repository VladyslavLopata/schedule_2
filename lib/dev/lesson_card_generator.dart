import 'package:schedule_2/models/card.dart';

class LessonCardGenerator {
  static List<LessonCard> _cards;

  static List<LessonCard> get cards {
    if (_cards == null) {
      _cards = List.generate(36, (index) => _generateLessonCard(index));
    }
    return _cards;
  }

  static LessonCard _generateLessonCard(int index) {
    return LessonCard(
      week: index ~/ 18 + 1,
      day: (index % 18) ~/ 3 + 1,
      number: (index % 18) % 6 % 3,
      name: 'Lesson number $index',
      teacher: 'Mr. $index',
      link: 'https://www.google.com',
    );
  }
}
