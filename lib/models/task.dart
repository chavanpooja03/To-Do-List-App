class Task {
  late String name;
  late bool isDone;
  Task({this.name = "", this.isDone = false});
  void toggleDone() {
    this.isDone = !isDone;
  }
}
