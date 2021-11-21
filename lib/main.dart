import 'package:clone_app_xxx/src/features/home/home_finger_detector.dart';
import 'package:flutter/material.dart';
import 'package:clone_app_xxx/src/core/sl/injection_container.dart' as sl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeFingerDetector(),
    );
  }
}
