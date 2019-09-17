import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'shared/themes/app_theme.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Page',
      home: LoginPage(),
      theme: AppTheme().theme(),
    );
  }
}
