import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyari_programi/model/to_do_item_data.dart';

class ToDoCard extends StatefulWidget {
  String title;
  String subtitle;
  int index;
  ToDoCard(this.title, this.subtitle, this.index, {Key? key}) : super(key: key);

  @override
  State<ToDoCard> createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  @override
  Widget build(BuildContext context) {
    Color cardColor =
        (Provider.of<ToDoItemData>(context).toDoItems[widget.index].situation ==
                'notDone')
            ? Colors.white
            : Provider.of<ToDoItemData>(context)
                        .toDoItems[widget.index]
                        .situation ==
                    'done'
                ? Colors.lightGreenAccent
                : Colors.orangeAccent;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        onDismissed: (_) {
          Provider.of<ToDoItemData>(context, listen: false)
              .removeItem(widget.index);
        },
        key: Key(widget.title),
        child: Card(
          color: cardColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(widget.title),
                subtitle: Text(widget.subtitle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    child: const Icon(Icons.watch_later_outlined),
                    onPressed: () {
                      if (Provider.of<ToDoItemData>(context, listen: false)
                                  .toDoItems[widget.index]
                                  .situation ==
                              'notDone' ||
                          Provider.of<ToDoItemData>(context, listen: false)
                                  .toDoItems[widget.index]
                                  .situation ==
                              'done') {
                        Provider.of<ToDoItemData>(context, listen: false)
                            .changeSituationToLater(widget.index);
                      } else {
                        Provider.of<ToDoItemData>(context, listen: false)
                            .changeSituationToNotDone(widget.index);
                      }
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    child: const Icon(Icons.done_all),
                    onPressed: () {
                      if (Provider.of<ToDoItemData>(context, listen: false)
                                  .toDoItems[widget.index]
                                  .situation ==
                              'notDone' ||
                          Provider.of<ToDoItemData>(context, listen: false)
                                  .toDoItems[widget.index]
                                  .situation ==
                              'later') {
                        Provider.of<ToDoItemData>(context, listen: false)
                            .changeSituationToDone(widget.index);
                      } else {
                        Provider.of<ToDoItemData>(context, listen: false)
                            .changeSituationToNotDone(widget.index);
                      }
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
