import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:onesignal/model/oneSignalCongig.dart';
import 'package:onesignal/onesignaldata.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class one_signal extends StatefulWidget {
  const one_signal({super.key});

  @override
  State<one_signal> createState() => _oneSignalState();
}

class _oneSignalState extends State<one_signal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future<void> init() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(null);
    });

    await OneSignal.shared.setAppId(oneSignalConmfig.appId);

    await OneSignal.shared
        .getDeviceState()
        .then((value) => {debugPrint("device id " + value!.userId.toString())});
    OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      debugPrint(result.notification.additionalData.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>onesignalData()));
     });
  }
Future<void> instant()async{
OneSignal.shared.setLogLevel(OSLogLevel.verbose,OSLogLevel.none);
OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) { 
  event.complete(null);
});
OneSignal.shared.getDeviceState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text("one signal"),
        ),
      ),
    );
  }
}
