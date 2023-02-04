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
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce app',
          // You can use the library anywhere in the app even in theme
          initialRoute: '/',
          routes: routes,
          theme: ThemeData(
            appBarTheme:   const AppBarTheme(
          
              backgroundColor: kTextLightColor,
              elevation: 0,
              foregroundColor: kTextColor,
            ),
            
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          //  home: child,
        );
      },
      //  child: const SplashScreenCustom(),
    );
  }
}
