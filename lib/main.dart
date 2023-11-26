import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppu/firebase_options.dart';
import 'package:shoppu/routes/routes.dart';
import 'package:shoppu/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const ShoppuApp(),
    ),
  );
}

class ShoppuApp extends StatelessWidget {
  const ShoppuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoppu',
      theme: AppTheme.lightTheme(context),
      initialRoute: splash,
      routes: routes,
    );
  }
}
