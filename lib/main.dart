import 'package:flutter/material.dart';
import 'package:uyari_programi/model/to_do_item_data.dart';
import 'package:uyari_programi/screen/to_do_screen.dart';
import 'package:provider/provider.dart';

import 'screen/categories.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ToDoItemData(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Categories(),
    );
  }
}
