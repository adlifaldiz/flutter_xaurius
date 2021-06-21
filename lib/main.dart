import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/service/localization_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/auth/bindings/auth_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: 'Xaurius',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: LocalizationService().getCurrentLocale(),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      initialBinding: AuthBinding(),
      onInit: () {
        Get.lazyPut(() => AuthController());
      },
      theme: ThemeData(
        unselectedWidgetColor: primaryColor,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        disabledColor: brokenWhiteColor,
        // highlightColor: accentColor,
        accentColor: backgroundPanelColor,
        brightness: Brightness.dark,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: textWhiteColor,
            ),
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            textTheme: Theme.of(context).textTheme.apply(bodyColor: textWhiteColor, fontSizeDelta: 0),
            iconTheme: IconThemeData(color: textWhiteColor),
            actionsIconTheme: IconThemeData(color: textWhiteColor),
            centerTitle: true),
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
