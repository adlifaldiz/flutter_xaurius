import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/auth/bindings/auth_binding.dart';


void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    _initCheck();
  }

  bool isUser = false;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      initialBinding: AuthBinding(),
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        disabledColor: brokenWhiteColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: textWhiteColor,
            ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: textWhiteColor, fontSizeDelta: 0),
          iconTheme: IconThemeData(color: textWhiteColor),
          actionsIconTheme: IconThemeData(color: textWhiteColor),
        ),
      ),
    );
  }

  void _initCheck() async {
    final appdata = GetStorage();

    if (appdata.read('isUser') != null) {
      setState(() {
        isUser = appdata.read('isUser');
      });
    }
  }
}
