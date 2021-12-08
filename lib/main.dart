import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui_app/route_generator.dart';

import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
              title: 'Flutter Travel UI',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: TextTheme(
                  headline1: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  headline2: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  bodyText1: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.9,
                  ),
                  bodyText2: const TextStyle(
                    color: Colors.grey,
                  ),
                  subtitle1: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    letterSpacing: 1.0,
                  ),
                  subtitle2: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                primaryColor: const Color(0xFF3EBACE),
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: const Color(0xFFDBECF1)),
                scaffoldBackgroundColor: const Color(0xFFF3F5F7),
              ),
              initialRoute: '/login_screen',
              onGenerateRoute: RouteGenerator.generateRoute,
            ));
  }
}
