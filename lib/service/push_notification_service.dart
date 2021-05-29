// import 'package:flutter_xaurius/helper/debug_utils.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
//
// class PushNotificationService {
//
//   static String playerId;
//
//   static int _recursive = 0;
//
//   static Future<void> initPlatformState() async {
//     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
//     var settings = {
//       OSiOSSettings.autoPrompt: false,
//       OSiOSSettings.promptBeforeOpeningPushUrl: true
//     };
//     await OneSignal.shared.init("a99777de-c82f-4884-93ce-2c1a5fc18f9d", iOSSettings: settings);
//     OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
//     await OneSignal.shared.promptUserForPushNotificationPermission(fallbackToSettings: true);
//   }
//
//   static Future<void> getPlayerId() async {
//     var status = await OneSignal.shared.getPermissionSubscriptionState();
//     playerId = status.subscriptionStatus.userId;
//     if(playerId == null || _recursive < 3){
//       _recursive++;
//       await getPlayerId();
//     }else{
//       _recursive = 0;
//     }
//   }
//
//   static Future<void> notificationHandler() async {
//     printDebug('getPermissionSubscriptionState');
//     var status = await OneSignal.shared.getPermissionSubscriptionState();
//
//     playerId = status.subscriptionStatus.userId;
//     printDebug('Player Id: $playerId');
//
//     printDebug('setNotificationReceivedHandler');
//     OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
//       printDebug("Received notification: \n${notification.jsonRepresentation().replaceAll("\\n", "\n")}");
//     });
//
//     printDebug('setNotificationOpenedHandler');
//     OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//       printDebug( "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}");
//     });
//
//     printDebug('setInAppMessageClickedHandler');
//     OneSignal.shared.setInAppMessageClickedHandler((OSInAppMessageAction action) {
//       printDebug("In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}");
//     });
//
//     printDebug('setSubscriptionObserver');
//     OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
//       print("SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}");
//       playerId = changes.to.userId;
//       printDebug('Player Id: $playerId');
//     });
//
//     printDebug('setPermissionObserver');
//     OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
//       print("PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}");
//     });
//
//     printDebug('setEmailSubscriptionObserver');
//     OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges changes) {
//       print("EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}");
//     });
//   }
// }
