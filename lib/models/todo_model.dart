class TodoModel {
  int id;
  String todo;
  String date;
  int done;
  String kategori;
  String jam;

  TodoModel({this.id, this.todo, this.date, this.done, this.kategori, this.jam});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    date = json['date'];
    done = json['done'];
    kategori = json['kategori'];
    jam = json['jam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['todo'] = this.todo;
    data['date'] = this.date;
    data['done'] = this.done;
    data['kategori'] = this.kategori;
    data['jam'] = this.jam;
    return data;
  }
}
