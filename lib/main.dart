import 'package:flutter/material.dart';

import '/core/presentation/app.dart';
import '/core/shared/di/injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}
