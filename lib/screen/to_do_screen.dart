import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyari_programi/model/to_do_item_data.dart';
import 'package:uyari_programi/widgets/to_do_adder.dart';

import '../widgets/to_do_card.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ToDoItemData>(context).readData();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              'Tüm Yapılacaklar',
              style: TextStyle(color: Colors.green, fontSize: 25),
            ),
          ),
        ),
      ),
      body: Consumer<ToDoItemData>(
        builder: (context, data, child) {
          return ListView.builder(
            itemCount: data.toDoItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ToDoCard(
                data.toDoItems[index].title,
                data.toDoItems[index].subtitle,
                index,
              );
            },
          );
        },
      ),
      floatingActionButton: const ToDoAdder(),
    );
  }
}
