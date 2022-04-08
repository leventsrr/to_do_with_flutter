import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyari_programi/model/to_do_item.dart';
import 'package:uyari_programi/model/to_do_item_data.dart';

class ToDoAdder extends StatefulWidget {
  const ToDoAdder({Key? key}) : super(key: key);

  @override
  State<ToDoAdder> createState() => _ToDoAdderState();
}

class _ToDoAdderState extends State<ToDoAdder> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleText = TextEditingController();
    TextEditingController _subtitleText = TextEditingController();
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          context: context,
          builder: (context) => SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      key: Key('title'),
                      controller: _titleText,
                      onChanged: (input) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Eklenecek Görev'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      key: Key('subtitle'),
                      controller: _subtitleText,
                      onChanged: (input) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Açıklama'),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<ToDoItemData>(context, listen: false)
                            .addItem(_titleText.text, _subtitleText.text);
                        Navigator.pop(context);
                        setState(() {
                          _titleText.text = "";
                          _subtitleText.text = "";
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Ekle',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.add)
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
      child: Icon(
        Icons.add,
        size: 45,
      ),
    );
  }
}
