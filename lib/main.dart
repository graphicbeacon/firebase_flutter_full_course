import 'package:flutter/material.dart';

import 'src/main_screen.dart';

import 'src/auth/stub.dart'
    if (dart.library.io) 'src/auth/android_auth_provider.dart'
    if (dart.library.html) 'src/auth/web_auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AuthProvider().initialize();

  runApp(MyApp());
}
