import 'package:flutter/material.dart';
import 'basic_config/routers.dart' show routerMap;
import 'basic_config/constant.dart' show appName;
import 'pages/tabs/tabs.dart' show HomeTabs;
import 'basic_core/storage_util.dart' show StorageUtil;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StorageUtil.initSync().then((value) {
      if (value) {
        setState((){});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      routes: routerMap,
      home: const HomeTabs(),
    );
  }
}
