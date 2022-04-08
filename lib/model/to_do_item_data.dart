import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'to_do_item.dart';

class ToDoItemData with ChangeNotifier {
  List<ToDoItem> toDoItems = [];

  late SharedPreferences _sharedPreferences;
  late String stringList;

  //SharedPreferences kullanarak 'ToDo' keyi ile stringe dönüştürülmüş yapılacaklar listesini kaydeder
  Future<void> writeData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    itemDataToString(toDoItems);
    _sharedPreferences.setString('ToDo', stringList);
  }

  //toDoItems listesini kaydetmek için string tipine dönüştürür
  void itemDataToString(List<ToDoItem> toDoItems) {
    List list = [];
    for (ToDoItem items in toDoItems) {
      list.add([items.title, items.subtitle, items.situation]);
    }
    stringList = jsonEncode(list);
  }

  //daha önce hafızaya kaydedilen bilgileri getirir
  Future<void> readData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final stringDatas = _sharedPreferences.getString('ToDo');
    stringDatas != null ? stringToItemData(stringDatas) : print("null");
    final success = await _sharedPreferences.remove('counter');
  }

  //hafızadaki bilgileri toDoItems listesine ekleyip ekrana basmak için string tipindeki listi list tipine dönüştürür ve toDoItems listesine ekler
  void stringToItemData(String datas) {
    final List dataList = json.decode(datas);
    toDoItems.clear();
    for (var item in dataList) {
      toDoItems
          .add(ToDoItem(title: item[0], subtitle: item[1], situation: item[2]));
    }
    notifyListeners();
  }

  //yeni yapılacak eklendiğinde
  void addItem(String title, String subtitle) {
    toDoItems.add(ToDoItem(title: title, subtitle: subtitle));
    writeData();
    notifyListeners();
  }

  //yapılacak silme
  void removeItem(int index) {
    toDoItems.removeAt(index);
    writeData();
    notifyListeners();
  }

  void changeSituationToLater(int index) {
    toDoItems[index].changeSituationToLater();
    writeData();
    notifyListeners();
  }

  void changeSituationToDone(int index) {
    toDoItems[index].changeSituationToDone();
    writeData();
    notifyListeners();
  }

  void changeSituationToNotDone(int index) {
    toDoItems[index].changeSituationToNotDone();
    writeData();
    notifyListeners();
  }
}
