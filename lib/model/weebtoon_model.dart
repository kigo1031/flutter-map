class WebtoonModel {
  String title, thumb, id;

  WebtoonModel(this.title, this.thumb, this.id);

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        thumb = json['thumb'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'thumb': thumb,
        'id': id,
      };

  @override
  String toString() {
    return 'WebtoonModel = [title : $title,\r\nthumb: $thumb,\r\nid : $id]\r\n';
  }
}
