// class Post {
//   int? id;
//   int? userId;
//   User? user;
//   String? text;
//   int? likeCount;
//   int? commentCount;
//   int? bookMarkCount;
//   int? dislikeCount;
//   String? timeStamp;

//   Post(
//       {this.id,
//       this.userId,
//       this.user,
//       this.text,
//       this.likeCount,
//       this.commentCount,
//       this.bookMarkCount,
//       this.dislikeCount,
//       this.timeStamp});

//   Post.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     userId = json['UserId'];
//     user = json['User'] != null ? User.fromJson(json['User']) : null;
//     text = json['Text'];
//     likeCount = json['LikeCount'];
//     commentCount = json['CommentCount'];
//     bookMarkCount = json['BookMarkCount'];
//     dislikeCount = json['DislikeCount'];
//     timeStamp = json['TimeStamp'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['Id'] = id;
//     data['UserId'] = userId;
//     if (user != null) {
//       data['User'] = user!.toJson();
//     }
//     data['Text'] = text;
//     data['LikeCount'] = likeCount;
//     data['CommentCount'] = commentCount;
//     data['BookMarkCount'] = bookMarkCount;
//     data['DislikeCount'] = dislikeCount;
//     data['TimeStamp'] = timeStamp;
//     return data;
//   }
// }

// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? userName;
//   String? avatar;
//   List<Post>? posts;

//   User(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.userName,
//       this.avatar,
//       this.posts});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     firstName = json['FirstName'];
//     lastName = json['LastName'];
//     userName = json['UserName'];
//     avatar = json['Avatar'];
//     if (json['Posts'] != null) {
//       posts = [];
//       json['Posts'].forEach((v) {
//         posts!.add(Post.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['Id'] = id;
//     data['FirstName'] = firstName;
//     data['LastName'] = lastName;
//     data['UserName'] = userName;
//     data['Avatar'] = avatar;
//     if (posts != null) {
//       data['Posts'] = posts!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
