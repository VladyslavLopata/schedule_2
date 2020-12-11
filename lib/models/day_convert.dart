class DayConvert {
  static String getStringFromIndex(int index) {
    switch (index) {
      case 1:
        return 'Понеділок';
      case 2:
        return 'Вівторок';
      case 3:
        return 'Середа';
      case 4:
        return 'Четвер';
      case 5:
        return "П'ятниця";
      case 6:
        return 'Субота';
    }
    return 'Помилка серверу';
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
