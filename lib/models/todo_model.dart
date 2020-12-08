class TodoModel {
  int id;
  String todo;
  String dateTime;
  String done;
  String kategori;

  TodoModel({this.id, this.todo, this.dateTime, this.done, this.kategori});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    dateTime = json['dateTime'];
    done = json['done'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['todo'] = this.todo;
    data['dateTime'] = this.dateTime;
    data['done'] = this.done;
    data['kategori'] = this.kategori;
    return data;
  }
}
