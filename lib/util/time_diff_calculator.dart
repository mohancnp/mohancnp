import 'package:flutter/material.dart';

/*gives time difference in minute in double. use truncated method to convert it to integer*/
double getSelectedTimeDifference(
    {required TimeOfDay time, required TimeOfDay currentTime}) {
  double _doubleYourTime = time.hour.toDouble() * 60 + (time.minute.toDouble());
  double _doubleNowTime =
      currentTime.hour.toDouble() * 60 + currentTime.minute.toDouble();
  double _timeDiff = _doubleYourTime - _doubleNowTime;
  return _timeDiff;
}
