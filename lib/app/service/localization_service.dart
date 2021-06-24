import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/service/locales/en_US.dart';
import 'package:flutter_xaurius/app/service/locales/in_ID.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {
  final appData = GetStorage();
  static final locale = Locale('en', 'US');
  static final fallBackLocale = Locale('en', 'US');
  static final langs = ['English', 'Indonesia'];
  static final locales = [
    Locale('en', 'US'),
    Locale('in', 'ID'),
  ];
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': inID,
      };

  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);
    appData.write('lng', lang);
    Get.updateLocale(locale);
  }

  Locale getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }

  Locale getCurrentLocale() {
    Locale defaultLocale;
    if (appData.read('lng') != null) {
      final locale = getLocaleFromLanguage(appData.read('lng'));
      defaultLocale = locale;
    } else {
      defaultLocale = Locale('en', 'US');
    }
    return defaultLocale;
  }

  String getCurrentLang() {
    return appData.read('lng') != null ? appData.read('lng') : 'English';
  }
}
