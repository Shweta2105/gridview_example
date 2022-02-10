import 'package:flutter/material.dart';
import 'package:simple_gridview/gridviewnumberpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'GridView Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: GridViewNumberPage(),
      );
}
