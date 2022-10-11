import 'package:flutter/material.dart';

import 'package:flutter_resteye/pages/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'NotoSansJP'),
      home: const HomePage(),
    );
  }
}
