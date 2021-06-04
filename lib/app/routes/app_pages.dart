import 'package:get/get.dart';

import 'package:flutter_xaurius/app/modules/article/bindings/article_binding.dart';
import 'package:flutter_xaurius/app/modules/article/views/article_view.dart';
import 'package:flutter_xaurius/app/modules/buy_xau/bindings/buy_xau_binding.dart';
import 'package:flutter_xaurius/app/modules/buy_xau/views/buy_xau_view.dart';
import 'package:flutter_xaurius/app/modules/checkout_xau/bindings/checkout_xau_binding.dart';
import 'package:flutter_xaurius/app/modules/checkout_xau/views/checkout_xau_view.dart';
import 'package:flutter_xaurius/app/modules/create_pin/bindings/create_pin_binding.dart';
import 'package:flutter_xaurius/app/modules/create_pin/views/create_pin_view.dart';
import 'package:flutter_xaurius/app/modules/deposit/bindings/deposit_binding.dart';
import 'package:flutter_xaurius/app/modules/deposit/views/deposit_view.dart';
import 'package:flutter_xaurius/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_xaurius/app/modules/home/views/home_view.dart';
import 'package:flutter_xaurius/app/modules/intro/bindings/intro_binding.dart';
import 'package:flutter_xaurius/app/modules/intro/views/intro_view.dart';
import 'package:flutter_xaurius/app/modules/invoice_xau/bindings/invoice_xau_binding.dart';
import 'package:flutter_xaurius/app/modules/invoice_xau/views/invoice_xau_view.dart';
import 'package:flutter_xaurius/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_xaurius/app/modules/login/views/login_view.dart';
import 'package:flutter_xaurius/app/modules/menus/bindings/menus_binding.dart';
import 'package:flutter_xaurius/app/modules/menus/dashboard/bindings/dashboard_binding.dart';
import 'package:flutter_xaurius/app/modules/menus/dashboard/views/dashboard_view.dart';
import 'package:flutter_xaurius/app/modules/menus/history/bindings/history_binding.dart';
import 'package:flutter_xaurius/app/modules/menus/history/views/history_view.dart';
import 'package:flutter_xaurius/app/modules/menus/settings/bindings/settings_binding.dart';
import 'package:flutter_xaurius/app/modules/menus/settings/views/settings_view.dart';
import 'package:flutter_xaurius/app/modules/menus/transaction/bindings/transaction_binding.dart';
import 'package:flutter_xaurius/app/modules/menus/transaction/views/transaction_view.dart';
import 'package:flutter_xaurius/app/modules/menus/views/menus_view.dart';
import 'package:flutter_xaurius/app/modules/profile/bank_account/bindings/bank_account_binding.dart';
import 'package:flutter_xaurius/app/modules/profile/bank_account/views/bank_account_view.dart';
import 'package:flutter_xaurius/app/modules/profile/document_identity/bindings/document_identity_binding.dart';
import 'package:flutter_xaurius/app/modules/profile/document_identity/views/document_identity_view.dart';
import 'package:flutter_xaurius/app/modules/profile/personal_data/bindings/personal_data_binding.dart';
import 'package:flutter_xaurius/app/modules/profile/personal_data/views/personal_data_view.dart';
import 'package:flutter_xaurius/app/modules/profile/views/profile_view.dart';
import 'package:flutter_xaurius/app/modules/signup/bindings/signup_binding.dart';
import 'package:flutter_xaurius/app/modules/signup/views/signup_view.dart';
import 'package:flutter_xaurius/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:flutter_xaurius/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:flutter_xaurius/app/modules/verif_code/bindings/verif_code_binding.dart';
import 'package:flutter_xaurius/app/modules/verif_code/views/verif_code_view.dart';
import 'package:flutter_xaurius/app/modules/verif_pin/bindings/verif_pin_binding.dart';
import 'package:flutter_xaurius/app/modules/verif_pin/views/verif_pin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.VERIF_CODE,
      page: () => VerifCodeView(),
      binding: VerifCodeBinding(),
    ),
    GetPage(
      name: _Paths.CRATE_PIN,
      page: () => CreatePinView(),
      binding: CreatePinBinding(),
    ),
    GetPage(
      name: _Paths.VERIF_PIN,
      page: () => VerifPinView(),
      binding: VerifPinBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      children: [
        GetPage(
          name: _Paths.PERSONAL_DATA,
          page: () => PersonalDataView(),
          binding: PersonalDataBinding(),
        ),
        GetPage(
          name: _Paths.DOCUMENT_IDENTITY,
          page: () => DocumentIdentityView(),
          binding: DocumentIdentityBinding(),
        ),
        GetPage(
          name: _Paths.BANK_ACCOUNT,
          page: () => BankAccountView(),
          binding: BankAccountBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MENUS,
      page: () => MenusView(),
      binding: MenusBinding(),
      children: [
        GetPage(
          name: _Paths.DASHBOARD,
          page: () => DashboardView(),
          binding: DashboardBinding(),
        ),
        GetPage(
          name: _Paths.TRANSACTION,
          page: () => TransactionView(),
          binding: TransactionBinding(),
        ),
        GetPage(
          name: _Paths.HISTORY,
          page: () => HistoryView(),
          binding: HistoryBinding(),
        ),
        GetPage(
          name: _Paths.SETTINS,
          page: () => SettingsView(),
          binding: SettingsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.BUY_XAU,
      page: () => BuyXauView(),
      binding: BuyXauBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT_XAU,
      page: () => CheckoutXauView(),
      binding: CheckoutXauBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE_XAU,
      page: () => InvoiceXauView(),
      binding: InvoiceXauBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT,
      page: () => DepositView(),
      binding: DepositBinding(),
    ),
  ];
}
