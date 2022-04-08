class ToDoItem {
  final String title;
  final String subtitle;
  String situation;
  // situation = [notDone,later,done]
  ToDoItem(
      {required this.title,
      required this.subtitle,
      this.situation = 'notDone'});

  void changeSituationToLater() {
    situation = 'later';
  }

  void changeSituationToDone() {
    situation = 'done';
  }

  void changeSituationToNotDone() {
    situation = 'notDone';
  }
}
