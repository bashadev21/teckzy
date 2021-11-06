import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:testdeep/attendence.dart';
import 'package:testdeep/controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testdeep/init.dart';
import 'login.dart';
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  // HttpOverrides.global =  MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  Get.put(InitCon());
  Get.put(Controller());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(62, 169, 248, 1),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'Teckzy',
        home: GetStorage().read('id') == null ? Login() : AttendenceView(),
        defaultTransition: Transition.cupertino,
        debugShowCheckedModeBanner: false,
        transitionDuration: const Duration(milliseconds: 800),
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.grey[50],
          primaryColor: const Color.fromRGBO(62, 169, 248, 1),
          accentColor: const Color.fromRGBO(30, 118, 245, 1),
        ),
      );
    });
  }
}
