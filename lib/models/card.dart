class LessonCard {
  int week;
  int day;
  String name;
  String teacher;
  int number;
  String link;
  LessonCard({
    this.week,
    this.day,
    this.name,
    this.teacher,
    this.number,
    this.link,
  });

  LessonCard copyWith({
    int week,
    int day,
    String lessonName,
    String teacher,
    int beginTime,
    String link,
  }) {
    return LessonCard(
      week: week ?? this.week,
      day: day ?? this.day,
      name: lessonName ?? name,
      teacher: teacher ?? this.teacher,
      number: beginTime ?? number,
      link: link ?? this.link,
    );
  }

  @override
  String toString() {
    return 'LessonCard(week: $week, day: $day, lessonName: $name, teacher: $teacher, beginTime: $number, link: $link)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LessonCard &&
        o.week == week &&
        o.day == day &&
        o.name == name &&
        o.teacher == teacher &&
        o.number == number &&
        o.link == link;
  }

  @override
  int get hashCode {
    return week.hashCode ^
        day.hashCode ^
        name.hashCode ^
        teacher.hashCode ^
        number.hashCode ^
        link.hashCode;
  }
}
