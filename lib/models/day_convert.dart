class DayConvert {
  static const Map<int, String> dayIndexMap = {
    1: 'Понеділок',
    2: 'Вівторок',
    3: 'Середа',
    4: 'Четвер',
    5: "П'ятниця",
    6: 'Субота',
  };
  static String getStringFromIndex(int index) {
    assert(dayIndexMap.containsKey(index),
        'index out of boud to convert to a valid day of week');
    return dayIndexMap[index];
  }

  static int getIndexFromString(String value) {
    assert(dayIndexMap.containsValue(value),
        'index out of boud to convert to a valid day of week');
    return dayIndexMap.entries
        .where((MapEntry<int, String> entry) => entry.value == value)
        .first
        .key;
  }

  static String getStringTimeFromNumber(int number) {
    switch (number) {
      case 0:
        return '08:30';
      case 1:
        return '10:25';
      case 2:
        return '12:20';
      case 3:
        return '14:15';
      case 4:
        return '16:10';
      case 5:
        return '18:05';
    }
    return '';
  }
}
