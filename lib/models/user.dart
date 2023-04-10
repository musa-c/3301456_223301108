class Userx {
  String? name;
  String? text;
  String? timestampt;
  String? commentCount;
  String? upCount;
  String? downCount;
  String? bookmarkerCount;

  Userx(
      {this.name,
      this.text,
      this.timestampt,
      this.commentCount,
      this.upCount,
      this.downCount,
      this.bookmarkerCount});

  // User.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   text = json['text'];
  //   timestampt = json['timestampt'];
  //   commentCount = json['commentCount'];
  //   upCount = json['upCount'];
  //   downCount = json['dowCount'];
  //   bookmarkerCount = json['bookmarkerCount'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['text'] = this.text;
  //   data['timestampt'] = this.timestampt;
  //   data['commentCount'] = this.commentCount;
  //   data['upCount'] = this.upCount;
  //   data['dowCount'] = this.downCount;
  //   data['bookmarkerCount'] = this.bookmarkerCount;
  //   return data;
  // }
}
