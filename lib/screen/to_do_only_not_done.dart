import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/to_do_item.dart';
import '../model/to_do_item_data.dart';
import '../widgets/to_do_categorized.dart';

class OnlyNotDone extends StatelessWidget {
  const OnlyNotDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ToDoItemData>(context).readData();
    List<ToDoItem> doneToDo = [];

    for (int i = 0;
        i < Provider.of<ToDoItemData>(context).toDoItems.length;
        i++) {
      if (Provider.of<ToDoItemData>(context).toDoItems[i].situation ==
          "notDone") {
        doneToDo.add(Provider.of<ToDoItemData>(context).toDoItems[i]);
      }
    }

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Yapılmayanlar',
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: doneToDo.length,
          itemBuilder: (BuildContext context, int index) {
            return CategorizedToDo(
                title: doneToDo[index].title,
                subtitle: doneToDo[index].subtitle);
          },
        ));
  }
}
