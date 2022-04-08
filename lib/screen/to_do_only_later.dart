import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyari_programi/widgets/to_do_categorized.dart';

import '../model/to_do_item.dart';
import '../model/to_do_item_data.dart';

class OnlyLater extends StatelessWidget {
  const OnlyLater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ToDoItemData>(context).readData();
    List<ToDoItem> laterToDo = [];

    for (int i = 0;
        i < Provider.of<ToDoItemData>(context).toDoItems.length;
        i++) {
      if (Provider.of<ToDoItemData>(context).toDoItems[i].situation ==
          "later") {
        laterToDo.add(Provider.of<ToDoItemData>(context).toDoItems[i]);
      }
    }

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Ertelenenler',
                style: TextStyle(color: Colors.orangeAccent, fontSize: 25),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: laterToDo.length,
          itemBuilder: (BuildContext context, int index) {
            return CategorizedToDo(
                title: laterToDo[index].title,
                subtitle: laterToDo[index].subtitle);
          },
        ));
  }
}
