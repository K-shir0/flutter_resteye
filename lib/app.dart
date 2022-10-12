import 'package:flutter/material.dart';

import 'package:flutter_resteye/pages/landing_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(fontFamily: 'NotoSansJP'),
          home: const LandingPage(),
        );
      },
    );
  }
}
