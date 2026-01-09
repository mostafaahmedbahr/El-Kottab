import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'core/app_services/remote_services/service_locator.dart';
import 'core/utils/bloc_observer.dart';
import 'lang/codegen_loader.g.dart';
import 'main_imports.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp();
  } else if(Platform.isAndroid){
    await Firebase.initializeApp();
  }
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

  FirebaseMessaging.onMessageOpenedApp;

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {}
  });
  FirebaseMessaging.instance.subscribeToTopic('all');

  FirebaseMessaging.instance.getToken().then((value) async {
    CacheHelper.saveData(key: "fcmToken", value: value);
  });

  await CacheHelper.init();
  String? token = await CacheTokenManger.getUserToken();
  debugPrint("Retrieved token: $token");

  await EasyLocalization.ensureInitialized();
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      startLocale: const Locale('en', ""),
      supportedLocales: const [
        Locale('ar', ""),
        Locale('en', ""),
      ],
      path: 'lib/lang',
      saveLocale: true,
      fallbackLocale: const Locale('en', ""),
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: MyApp(),
    ),
  );
}

Future<void> getFcmToken() async {
  try {
    if (Platform.isIOS) {
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken == null) {
        log('apnsToken is null');
        return;
      }else{
        log("apnsToken = $apnsToken");
        CacheHelper.saveData(
            key: "fcmToken", value: apnsToken);
      }
    }
    if(Platform.isAndroid){
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken == null) {
        log('fcmToken is null');
        return;
      }else{
        CacheHelper.saveData(
            key: "fcmToken", value: fcmToken);

      }
    }
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    }).onError((err) {
      log(err.toString());
    });

  } catch (e) {
    log(e.toString());
  }
}