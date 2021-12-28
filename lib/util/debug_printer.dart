import 'package:flutter/foundation.dart';

void dPrint(message) {
  if (!kReleaseMode) {
    print(message);
  }
}
