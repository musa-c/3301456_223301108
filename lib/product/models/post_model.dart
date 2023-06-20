class Post {
  int? id;
  int? userId;
  User? user;
  String? text;
  int? likeCount;
  int? commentCount;
  int? bookMarkCount;
  int? dislikeCount;
  String? timeStamp;
  List<Likes>? likes;
  List<Dislikes>? dislikes;
  List<BookMarks>? bookMarks;

  Post({
    this.id,
    this.userId,
    this.user,
    this.text,
    this.likeCount,
    this.commentCount,
    this.bookMarkCount,
    this.dislikeCount,
    this.timeStamp,
    this.likes,
    this.dislikes,
    this.bookMarks,
  });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    text = json['Text'];
    likeCount = json['LikeCount'];
    commentCount = json['CommentCount'];
    bookMarkCount = json['BookMarkCount'];
    dislikeCount = json['DislikeCount'];
    timeStamp = json['TimeStamp'];
    if (json['Likes'] != null) {
      likes = <Likes>[];
      json['Likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
    if (json['Dislikes'] != null) {
      dislikes = <Dislikes>[];
      json['Dislikes'].forEach((v) {
        dislikes!.add(Dislikes.fromJson(v));
      });
    }
    if (json['BookMarks'] != null) {
      bookMarks = <BookMarks>[];
      json['BookMarks'].forEach((v) {
        bookMarks!.add(BookMarks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    data['Text'] = text;
    data['LikeCount'] = likeCount;
    data['CommentCount'] = commentCount;
    data['BookMarkCount'] = bookMarkCount;
    data['DislikeCount'] = dislikeCount;
    data['TimeStamp'] = timeStamp;
    if (likes != null) {
      data['Likes'] = likes!.map((v) => v.toJson()).toList();
    }
    if (dislikes != null) {
      data['Dislikes'] = dislikes!.map((v) => v.toJson()).toList();
    }
    if (bookMarks != null) {
      data['BookMarks'] = bookMarks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  int? likeCount = 0;
  int? commentCount = 0;
  int? bookMarkCount = 0;
  int? dislikeCount = 0;
  String? firstName;
  String? lastName;
  String? userName;
  String? avatar;
  List<Post>? posts;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.avatar,
    this.posts,
    this.likeCount = 0,
    this.commentCount = 0,
    this.bookMarkCount = 0,
    this.dislikeCount = 0,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    likeCount = json['LikeCount'];
    commentCount = json['CommentCount'];
    bookMarkCount = json['BookMarkCount'];
    dislikeCount = json['DislikeCount'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userName = json['UserName'];
    avatar = json['Avatar'];
    if (json['Posts'] != null) {
      posts = [];
      json['Posts'].forEach((v) {
        posts!.add(Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['LikeCount'] = likeCount;
    data['CommentCount'] = commentCount;
    data['BookMarkCount'] = bookMarkCount;
    data['DislikeCount'] = dislikeCount;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['UserName'] = userName;
    data['Avatar'] = avatar;
    if (posts != null) {
      data['Posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Likes {
  int? id;
  int? postId;
  int? userId;

  Likes({this.id, this.postId, this.userId});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    postId = json['PostId'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['PostId'] = postId;
    data['UserId'] = userId;
    return data;
  }
}

class Dislikes {
  int? id;
  int? postId;
  int? userId;

  Dislikes({this.id, this.postId, this.userId});

  Dislikes.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    postId = json['PostId'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['PostId'] = postId;
    data['UserId'] = userId;
    return data;
  }
}

class BookMarks {
  int? id;
  int? postId;
  int? userId;

  BookMarks({this.id, this.postId, this.userId});

  BookMarks.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    postId = json['PostId'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['PostId'] = postId;
    data['UserId'] = userId;
    return data;
  }
}
