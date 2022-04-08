import 'package:flutter/material.dart';

class CategorizedToDo extends StatefulWidget {
  String title;
  String subtitle;
  CategorizedToDo({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  State<CategorizedToDo> createState() => _CategorizedToDoState();
}

class _CategorizedToDoState extends State<CategorizedToDo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.orangeAccent,
        child: Column(
          children: [
            ListTile(
              title: Text(widget.title),
              subtitle: Text(widget.subtitle),
            ),
          ],
        ),
      ),
    );
  }
}
