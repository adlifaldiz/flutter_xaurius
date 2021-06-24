import 'package:get/get.dart';

import 'package:flutter_xaurius/app/modules/Social_Media/bindings/social_media_binding.dart';
import 'package:flutter_xaurius/app/modules/Social_Media/views/social_media_view.dart';
import 'package:flutter_xaurius/app/modules/article/bindings/article_binding.dart';
import 'package:flutter_xaurius/app/modules/article/views/article_view.dart';
import 'package:flutter_xaurius/app/modules/auth/bindings/auth_binding.dart';
import 'package:flutter_xaurius/app/modules/auth/views/auth_view.dart';
import 'package:flutter_xaurius/app/modules/bank/bindings/bank_binding.dart';
import 'package:flutter_xaurius/app/modules/bank/views/bank_view.dart';
import 'package:flutter_xaurius/app/modules/buy_xau/bindings/buy_xau_binding.dart';
import 'package:flutter_xaurius/app/modules/buy_xau/views/buy_xau_view.dart';
import 'package:flutter_xaurius/app/modules/chart_view/bindings/chart_view_binding.dart';
import 'package:flutter_xaurius/app/modules/chart_view/views/chart_view_view.dart';
import 'package:flutter_xaurius/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:flutter_xaurius/app/modules/checkout/views/checkout_view.dart';
import 'package:flutter_xaurius/app/modules/create_pin/bindings/create_pin_binding.dart';
import 'package:flutter_xaurius/app/modules/create_pin/views/create_pin_view.dart';
import 'package:flutter_xaurius/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:flutter_xaurius/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_xaurius/app/modules/data_personal/bindings/data_personal_binding.dart';
import 'package:flutter_xaurius/app/modules/data_personal/views/data_personal_view.dart';
import 'package:flutter_xaurius/app/modules/deposit/bindings/deposit_binding.dart';
import 'package:flutter_xaurius/app/modules/deposit/views/deposit_view.dart';
import 'package:flutter_xaurius/app/modules/faq/bindings/faq_binding.dart';
import 'package:flutter_xaurius/app/modules/faq/views/faq_view.dart';
import 'package:flutter_xaurius/app/modules/gold_price/bindings/gold_price_binding.dart';
import 'package:flutter_xaurius/app/modules/gold_price/views/gold_price_view.dart';
import 'package:flutter_xaurius/app/modules/history/bindings/history_binding.dart';
import 'package:flutter_xaurius/app/modules/history/buy_history/bindings/buy_history_binding.dart';
import 'package:flutter_xaurius/app/modules/history/buy_history/views/buy_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/deposit_history/bindings/deposit_history_binding.dart';
import 'package:flutter_xaurius/app/modules/history/deposit_history/views/deposit_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/sell_history/bindings/sell_history_binding.dart';
import 'package:flutter_xaurius/app/modules/history/sell_history/views/sell_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/topup_history/bindings/topup_history_binding.dart';
import 'package:flutter_xaurius/app/modules/history/topup_history/views/topup_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/views/history_view.dart';
import 'package:flutter_xaurius/app/modules/history/withdraw_history/bindings/withdraw_history_binding.dart';
import 'package:flutter_xaurius/app/modules/history/withdraw_history/views/withdraw_history_view.dart';
import 'package:flutter_xaurius/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_xaurius/app/modules/home/views/home_view.dart';
import 'package:flutter_xaurius/app/modules/invoice/bindings/invoice_binding.dart';
import 'package:flutter_xaurius/app/modules/invoice/views/invoice_view.dart';
import 'package:flutter_xaurius/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_xaurius/app/modules/login/views/login_view.dart';
import 'package:flutter_xaurius/app/modules/menu/bindings/menu_binding.dart';
import 'package:flutter_xaurius/app/modules/menu/views/menu_view.dart';
import 'package:flutter_xaurius/app/modules/notification/bindings/notification_binding.dart';
import 'package:flutter_xaurius/app/modules/notification/views/notification_view.dart';
import 'package:flutter_xaurius/app/modules/onBoarding/bindings/on_boarding_binding.dart';
import 'package:flutter_xaurius/app/modules/onBoarding/views/on_boarding_view.dart';
import 'package:flutter_xaurius/app/modules/onboard_language/bindings/onboard_language_binding.dart';
import 'package:flutter_xaurius/app/modules/onboard_language/views/onboard_language_view.dart';
import 'package:flutter_xaurius/app/modules/privacy_policy/bindings/privacy_policy_binding.dart';
import 'package:flutter_xaurius/app/modules/privacy_policy/views/privacy_policy_view.dart';
import 'package:flutter_xaurius/app/modules/profile/bindings/profile_binding.dart';
import 'package:flutter_xaurius/app/modules/profile/views/profile_view.dart';
import 'package:flutter_xaurius/app/modules/re_login/bindings/re_login_binding.dart';
import 'package:flutter_xaurius/app/modules/re_login/views/re_login_view.dart';
import 'package:flutter_xaurius/app/modules/register/bindings/register_binding.dart';
import 'package:flutter_xaurius/app/modules/register/views/register_view.dart';
import 'package:flutter_xaurius/app/modules/sell_xau/bindings/sell_xau_binding.dart';
import 'package:flutter_xaurius/app/modules/sell_xau/views/sell_xau_view.dart';
import 'package:flutter_xaurius/app/modules/setting/bindings/setting_binding.dart';
import 'package:flutter_xaurius/app/modules/setting/views/setting_view.dart';
import 'package:flutter_xaurius/app/modules/splash/bindings/splash_binding.dart';
import 'package:flutter_xaurius/app/modules/splash/views/splash_view.dart';
import 'package:flutter_xaurius/app/modules/system/bindings/system_binding.dart';
import 'package:flutter_xaurius/app/modules/system/views/system_view.dart';
import 'package:flutter_xaurius/app/modules/tnc/bindings/tnc_binding.dart';
import 'package:flutter_xaurius/app/modules/tnc/views/tnc_view.dart';
import 'package:flutter_xaurius/app/modules/top_up/bindings/top_up_binding.dart';
import 'package:flutter_xaurius/app/modules/top_up/views/top_up_view.dart';
import 'package:flutter_xaurius/app/modules/top_up_detail/bindings/top_up_detail_binding.dart';
import 'package:flutter_xaurius/app/modules/top_up_detail/views/top_up_detail_view.dart';
import 'package:flutter_xaurius/app/modules/transaction/bindings/transaction_binding.dart';
import 'package:flutter_xaurius/app/modules/transaction/views/transaction_view.dart';
import 'package:flutter_xaurius/app/modules/upload_document/bindings/upload_document_binding.dart';
import 'package:flutter_xaurius/app/modules/upload_document/views/upload_document_view.dart';
import 'package:flutter_xaurius/app/modules/verify_code/bindings/verify_code_binding.dart';
import 'package:flutter_xaurius/app/modules/verify_code/views/verify_code_view.dart';
import 'package:flutter_xaurius/app/modules/verify_pin/bindings/verify_pin_binding.dart';
import 'package:flutter_xaurius/app/modules/verify_pin/views/verify_pin_view.dart';
import 'package:flutter_xaurius/app/modules/voucher/bindings/voucher_binding.dart';
import 'package:flutter_xaurius/app/modules/voucher/views/voucher_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
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
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BANK,
      page: () => BankView(),
      binding: BankBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT,
      page: () => DepositView(),
      binding: DepositBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.TNC,
      page: () => TncView(),
      binding: TncBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
      children: [
        GetPage(
          name: _Paths.BUY_HISTORY,
          page: () => BuyHistoryView(),
          binding: BuyHistoryBinding(),
        ),
        GetPage(
          name: _Paths.SELL_HISTORY,
          page: () => SellHistoryView(),
          binding: SellHistoryBinding(),
        ),
        GetPage(
          name: _Paths.TOPUP_HISTORY,
          page: () => TopupHistoryView(),
          binding: TopupHistoryBinding(),
        ),
        GetPage(
          name: _Paths.DEPOSIT_HISTORY,
          page: () => DepositHistoryView(),
          binding: DepositHistoryBinding(),
        ),
        GetPage(
          name: _Paths.WITHDRAW_HISTORY,
          page: () => WithdrawHistoryView(),
          binding: WithdrawHistoryBinding(),
        ),
      ],
    ),
    GetPage(name: _Paths.MENU, page: () => MenuView(), bindings: [
      MenuBinding(),
      DashboardBinding(),
      HistoryBinding(),
      TransactionBinding(),
      SettingBinding(),
    ]),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL_MEDIA,
      page: () => SocialMediaView(),
      binding: SocialMediaBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PIN,
      page: () => CreatePinView(),
      binding: CreatePinBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_PIN,
      page: () => VerifyPinView(),
      binding: VerifyPinBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_DOCUMENT,
      page: () => UploadDocumentView(),
      binding: UploadDocumentBinding(),
    ),
    GetPage(
      name: _Paths.DATA_PERSONAL,
      page: () => DataPersonalView(),
      binding: DataPersonalBinding(),
    ),
    GetPage(
      name: _Paths.TOP_UP_DETAIL,
      page: () => TopUpDetailView(),
      binding: TopUpDetailBinding(),
    ),
    GetPage(
      name: _Paths.TOP_UP,
      page: () => TopUpView(),
      binding: TopUpBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => InvoiceView(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.BUY_XAU,
      page: () => BuyXauView(),
      binding: BuyXauBinding(),
    ),
    GetPage(
      name: _Paths.SELL_XAU,
      page: () => SellXauView(),
      binding: SellXauBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_CODE,
      page: () => VerifyCodeView(),
      binding: VerifyCodeBinding(),
    ),
    GetPage(
      name: _Paths.RE_LOGIN,
      page: () => ReLoginView(),
      binding: ReLoginBinding(),
    ),
    GetPage(
      name: _Paths.GOLD_PRICE,
      page: () => GoldPriceView(),
      binding: GoldPriceBinding(),
    ),
    GetPage(
      name: _Paths.VOUCHER,
      page: () => VoucherView(),
      binding: VoucherBinding(),
    ),
    GetPage(
      name: _Paths.CHART_VIEW,
      page: () => ChartViewView(),
      binding: ChartViewBinding(),
    ),
    GetPage(
      name: _Paths.SYSTEM,
      page: () => SystemView(),
      binding: SystemBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD_LANGUAGE,
      page: () => OnboardLanguageView(),
      binding: OnboardLanguageBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
  ];
}
