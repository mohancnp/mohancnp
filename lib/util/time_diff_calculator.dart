import 'package:flutter/material.dart';

double getSelectedTimeDifference(
    {required TimeOfDay time, required TimeOfDay currentTime}) {
  double _doubleYourTime = time.hour.toDouble() + (time.minute.toDouble() / 60);
  double _doubleNowTime =
      currentTime.hour.toDouble() + (currentTime.minute.toDouble() / 60);
  double _timeDiff = _doubleYourTime - _doubleNowTime;
  return _timeDiff;
  // int _hr = _timeDiff.truncate();
  // int _minute = ((_timeDiff - _timeDiff.truncate()) * 60).toInt();
  // print('Here your Happy $_hr Hour and also $_minute min');
}
