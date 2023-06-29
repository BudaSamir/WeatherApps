import 'package:easy_localization/easy_localization.dart';
import 'package:weather_app_three/shared/constants/string_keys.dart';

DateTime getDate(int timesTamp) {
  return DateTime.fromMillisecondsSinceEpoch(timesTamp * 1000);
}

String getImeHour(int? timesTamp) {
  String time = "";
  if (timesTamp != null) {
    try {
      DateTime date = getDate(timesTamp);
      if (timesTamp != 0) {
        time =
            "${date.hour} : ${date.minute.toString().length == 1 ? "0${date.minute}" : "${date.minute}"}";
      }
    } catch (e) {
      print(e);
    }
  }
  return time;
}

String getMonth(DateTime date) {
  switch (date.month) {
    case 1:
      return StringsKeys.jan.tr();
    case 2:
      return StringsKeys.feb.tr();
    case 3:
      return StringsKeys.mar.tr();
    case 4:
      return StringsKeys.apr.tr();
    case 5:
      return StringsKeys.may.tr();
    case 6:
      return StringsKeys.jun.tr();
    case 7:
      return StringsKeys.jul.tr();
    case 8:
      return StringsKeys.aug.tr();
    case 9:
      return StringsKeys.sept.tr();
    case 10:
      return StringsKeys.oct.tr();
    case 11:
      return StringsKeys.nov.tr();
    case 12:
      return StringsKeys.dec.tr();
    default:
      return '';
  }
}

String getDaysAndMonth(int? timesTamp) {
  if (timesTamp != null) {
    DateTime date = getDate(timesTamp);
    return "${date.day} ${getMonth(date)}";
  } else {
    return '';
  }
}
