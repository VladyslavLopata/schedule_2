// import 'package:schedule_2/models/card.dart';

// // ignore: avoid_classes_with_only_static_members
// class LessonCardGenerator {
//   static List<LessonCard> _cards;

//   static List<LessonCard> get cards {
//     return _cards ??= List.generate(36, (index) => _generateLessonCard(index));
//   }

//   static LessonCard _generateLessonCard(int index) {
//     return LessonCard(
//       week: index ~/ 18 + 1,
//       day: (index % 18) ~/ 3 + 1,
//       number: (index % 18) % 6 % 3,
//       name: 'Lesson number $index',
//       teacher: 'Mr. $index',
//       link: 'https://www.google.com',
//     );
//   }
// }
