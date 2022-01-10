//date format to trim:
// 2021-11-15T16:00:39.000000Z

String getTrimmedDateAndTime({required String dateToTrim}) {
  var todaysDate = DateTime.now();
  var dateTime = DateTime.parse(dateToTrim.substring(0, 16));
  if ((todaysDate.difference(dateTime)).inDays <= 1) {
    return dateToTrim.substring(12, 16);
  }
  return dateToTrim.substring(0, 16);
}

//to get the time from the date time stamp
//format : 2022-1-06 16:43:56
String getTimeFromDateTimeStamp(String dateTimeStamp) {
  print(dateTimeStamp);
  return dateTimeStamp.substring(11);
}
