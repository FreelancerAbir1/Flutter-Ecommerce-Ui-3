import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommecre_ui3/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce app',
          initialRoute: '/',
          routes: routes,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: kTextLightColor,
              elevation: 0,
              foregroundColor: kTextColor,
            ),
            colorScheme: const ColorScheme(
              background: kPrimaryColor,
              onBackground: Colors.red,
              brightness: Brightness.light,
              error: Colors.blue,
              surface: Colors.yellow,
              onError: Colors.orange,
              onSecondary: Colors.black87,
              onPrimary: Colors.yellowAccent,
              onSurface: Colors.redAccent,
              secondary: kPrimaryColor,
              primary: kPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}
