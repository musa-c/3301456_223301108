// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print

import 'dart:async';
import 'package:abc/product/constants/color_constants.dart';
import 'package:abc/product/api/controllers/concrete/post_controller.dart';
import 'package:abc/product/file_operations/controllers/concrete/file_controller.dart';
import 'package:abc/product/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../api/controllers/concrete/bookmark_controller.dart';
import '../api/controllers/concrete/dislike_controller.dart';
import '../api/controllers/concrete/likes_controller.dart';
import 'button_widget.dart';
import 'list_card_bookmarkusers_widget.dart';
import 'list_card_dislikeusers_widget.dart';
import 'list_card_likeusers_widget.dart';
import 'list_icon_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListProfileWidget extends StatefulWidget {
  User? user;
  User? myuser;
  void Function()? callbackGetPost;
  ListProfileWidget({super.key, this.myuser, this.user, this.callbackGetPost});

  @override
  State<ListProfileWidget> createState() => _ListProfileWidgetState();
}

class _ListProfileWidgetState extends State<ListProfileWidget> {
  final String _url = "https://picsum.photos/id/237/200/300";
  final TextEditingController _textController = TextEditingController();
  PostController postController = PostController();
  FileController fileController = FileController();
  List<Post>? posts = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getPost();
  }

  bool isUserIdLike(List<Likes>? likesList) {
    if (likesList == null) return false;
    return likesList.any((like) => like.userId == widget.myuser!.id);
  }

  bool isUserIdDislike(List<Dislikes>? dislikesList) {
    if (dislikesList == null) return false;
    return dislikesList.any((dislike) => dislike.userId == widget.myuser!.id);
  }

  bool isUserIdBookMark(List<BookMarks>? bookMarkesList) {
    if (bookMarkesList == null) return false;
    return bookMarkesList
        .any((bookMark) => bookMark.userId == widget.myuser!.id);
  }

  String textvalue = "";
  String updateText = "";

  void createPost(String text, BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final http.Response response;
    try {
      response = await postController.createPost(widget.myuser!.id!, text);
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        getPost();
        // ignore: use_build_context_synchronously
        Fluttertoast.showToast(
          msg: "Bir ses çıkartıldı.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: ColorConstants.blackColor,
          textColor: ColorConstants.purpleColor,
          webPosition: "center",
          webBgColor: "#808080",
          fontSize: 16.0,
        );
        Navigator.pop(context);
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void getPost() async {
    try {
      List<Post> postList = await postController.getPostByUserId(
          widget.user?.id == null ? widget.myuser!.id! : widget.user!.id!);
      setState(() {
        posts = postList;
      });
    } catch (e) {
      print(e);
    }
  }

  void deletePost(int postId) async {
    final http.Response response;
    try {
      response = await postController.deletePost(postId);
      if (response.statusCode == 200) {
        getPost();
      } else {
        print("başarısız.");
      }
    } catch (e) {
      print(e);
    }
  }

  void updatePost(Post post) async {
    final http.Response response;
    try {
      if (updateText != post.text && updateText != "") {
        response = await postController.updatePost(post.id!, updateText);
        if (response.statusCode == 200) {
          getPost();
          Fluttertoast.showToast(
            msg: "Post güncellendi!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: ColorConstants.blackColor,
            textColor: ColorConstants.purpleColor,
            webPosition: "center",
            webBgColor: "#808080",
            fontSize: 16.0,
          );
        } else {
          print(response.body);
          print(response.statusCode);

          print("başarısız.");
        }
      } else {
        AlertDialog(title: Text("Hata"));
      }
    } catch (e) {
      print(e);
    }
  }

  void fileSave(Post post) async {
    if (updateText != "") {
      await fileController
          .saveToFile(updateText)
          .then((value) => Fluttertoast.showToast(
                msg: "Post dosyaya kaydedildi!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                backgroundColor: ColorConstants.blackColor,
                textColor: ColorConstants.purpleColor,
                webPosition: "center",
                webBgColor: "#808080",
                fontSize: 16.0,
                // ignore: invalid_return_type_for_catch_error
              ).catchError((a) => print("başarıı<")));
    } else {
      await fileController
          .saveToFile(post.text!)
          .then((value) => Fluttertoast.showToast(
                msg: "Post dosyaya kaydedildi!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                backgroundColor: ColorConstants.blackColor,
                textColor: ColorConstants.purpleColor,
                webPosition: "center",
                webBgColor: "#808080",
                fontSize: 16.0,
                // ignore: invalid_return_type_for_catch_error
              ).catchError((a) => print("başarıı<")));
    }
  }

  void setLike(int postId) async {
    int userId = widget.myuser!.id!;
    final http.Response response;
    LikeController likeController = LikeController();
    try {
      response = await likeController.createLike(userId, postId);
      if (response.statusCode == 200 || response.statusCode == 204) {
        getPost();
        if (widget.callbackGetPost != null) {
          widget.callbackGetPost!();
        }
      } else {
        print(response.statusCode);
        print(response.body);
        print("hata");
      }
    } catch (e) {
      print(e);
    }
  }

  void setDislike(int postId) async {
    int userId = widget.myuser!.id!;
    final http.Response response;
    DislikesController dislikesController = DislikesController();
    try {
      response = await dislikesController.createDislike(userId, postId);

      if (response.statusCode == 200 || response.statusCode == 204) {
        getPost();
        if (widget.callbackGetPost != null) {
          widget.callbackGetPost!();
        }
      } else {
        print("hata");
      }
    } catch (e) {
      print(e);
    }
  }

  void setBookMark(int postId) async {
    int userId = widget.myuser!.id!;
    final http.Response response;
    BookMarkController bookMarkController = BookMarkController();
    try {
      response = await bookMarkController.createBookMark(userId, postId);
      if (response.statusCode == 200 || response.statusCode == 204) {
        getPost();
        if (widget.callbackGetPost != null) {
          widget.callbackGetPost!();
        }
      } else {
        print("hata");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: true,
        floatingActionButton: widget.user?.id == null
            ? null
            : widget.user?.id == widget.myuser!.id
                ? _floatingActionButton
                : null,
        body: _listViewBuilder);
  }

  Widget get _text => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Henüz bir şey yazmadınız",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          )
        ],
      ));

  Widget get _floatingActionButton => FloatingActionButton(
      backgroundColor: Colors.black,
      elevation: 2,
      focusColor: Colors.black,
      splashColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.deepPurple, // Sınır rengi
            width: 2, // Sınır kalınlığı
          ),
          borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        _showDialog;
      },
      child: Icon(Icons.add));

  Future<dynamic> get _showDialog => showDialog(
        context: context,
        // useRootNavigator: true,
        builder: (BuildContext context) {
          return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
              ),
              body: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: _textController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(60, 60, 67, 0.6)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(60, 60, 67, 0.6)),
                        ),
                        hintText: 'birşeyler yaz...',
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Color.fromRGBO(60, 60, 67, 0.6),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      validator: (value) {
                        // Geçerlilik denetimi yapılabilir
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          textvalue = value;
                        });
                        // Metin değiştiğinde yapılacak işlemler
                      },
                    ),
                  ),
                  ButtonWidget(
                      onPressed: () {
                        createPost(textvalue, context);
                      },
                      child: isLoading
                          ? CircularProgressIndicator()
                          : Text("Gönder gitsin")),
                  SizedBox(height: 10),
                  ButtonWidget(
                      onPressed: () {
                        fileController.readFromFile().then((postText) => {
                              setState(() {
                                _textController.text = postText;
                                textvalue = postText;
                              })
                            });
                      },
                      child: Text("Kaydetiğin postu göster."))
                ],
              ));
        },
      );

  Widget get _listViewBuilder => ListView.builder(
      itemCount: posts!.length,
      itemBuilder: (context, index) {
        Post post = posts![index];
        DateTime dateTime = DateTime.parse(post.timeStamp!);
        String formattedDateTime =
            DateFormat('dd.MM.yyyy HH:mm').format(dateTime);
        return _listCont(post, formattedDateTime);
      });

  Widget _listCont(Post post, String formattedDateTime) => Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: _listContBorder,
      ),
      child: _listTile(post, formattedDateTime));

  Border get _listContBorder => const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      top: BorderSide(width: 0),
      right: BorderSide(width: 0),
      left: BorderSide(width: 0));

  Widget _listTile(Post post, String formattedDateTime) => ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      leading: _listAvatar(),
      subtitle: _listContext(post),
      title: _listTitle(
          widget.user?.userName == null
              ? widget.myuser!.userName!
              : widget.user!.userName!,
          formattedDateTime));

  Widget _listAvatar() => Container(
      height: double.infinity,
      // ignore: sized_box_for_whitespace
      margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
      child: _listAvatarChilt());

  Widget _listAvatarChilt() =>
      CircleAvatar(radius: 24, backgroundImage: NetworkImage(_url)
          // UserData().getAvatar(widget.username!) == null
          //     ? NetworkImage(_url)
          //     : NetworkImage(UserData().getAvatar(widget.username!)!),
          );

  Widget _listCartUserName(String text) => Text(
        text,
        style: titleTextStyle,
      );

  void _postDialog(Post post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ne yapmak istiyorsun?'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.text!),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(60, 60, 67, 0.6)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(60, 60, 67, 0.6)),
                    ),
                    hintText: 'güncelle...',
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                  style:
                      TextStyle(fontSize: 16, color: ColorConstants.blackColor),
                  onChanged: (value) {
                    setState(() {
                      updateText = value;
                    });
                    // Metin değiştiğinde yapılacak işlemler
                  },
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  child: const Text('Sil'),
                  onPressed: () {
                    deletePost(post.id!);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text("Güncelle"),
                  onPressed: () {
                    updatePost(post);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text("Dosyaya kaydet"),
                  onPressed: () {
                    fileSave(post);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Vazgeç'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void Modal(int postId, String opr, Widget List) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text(opr),
              backgroundColor: ColorConstants.blackColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Geri dönüş butonuna basıldığında dialog kapatılıyor
                },
              ),
            ),
            body: List);
      },
    );
  }

  Widget _listContext(Post post) => GestureDetector(
        onLongPress: () {
          widget.user?.id == null
              ? null
              : widget.user?.id == widget.myuser!.id
                  ? _postDialog(post)
                  : null;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.text!,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color.fromRGBO(255, 250, 250, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 14.6, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListIconWidget(
                    icon: Icons.messenger_outline_rounded,
                    count: post.commentCount,
                    onTap: () {},
                  ),
                  ListIconWidget(
                    icon: Icons.arrow_upward_rounded,
                    count: post.likeCount,
                    color: isUserIdLike(post.likes)
                        ? ColorConstants.likeColor
                        : ColorConstants.primaryGreyColor,
                    onTap: () {
                      setLike(post.id!);
                    },
                    onTapUser: () {
                      post.likeCount != 0
                          ? Modal(
                              post.id!,
                              "Beğenenler",
                              ListCardLikeUsers(
                                postId: post.id!,
                                myuser: widget.myuser,
                              ))
                          : null;
                    },
                  ),
                  ListIconWidget(
                    icon: Icons.arrow_downward_rounded,
                    count: post.dislikeCount,
                    color: isUserIdDislike(post.dislikes)
                        ? ColorConstants.dislikeColor
                        : ColorConstants.primaryGreyColor,
                    onTap: () {
                      setDislike(post.id!);
                    },
                    onTapUser: () {
                      post.dislikeCount != 0
                          ? Modal(
                              post.id!,
                              "Beğenmeyenler",
                              ListCardDislikeUsers(
                                postId: post.id!,
                                myuser: widget.myuser,
                              ))
                          : null;
                    },
                  ),
                  ListIconWidget(
                    icon: Icons.bookmark_border_rounded,
                    count: post.bookMarkCount,
                    color: isUserIdBookMark(post.bookMarks)
                        ? ColorConstants.bookMarkColor
                        : ColorConstants.primaryGreyColor,
                    onTap: () {
                      setBookMark(post.id!);
                    },
                    onTapUser: () {
                      post.bookMarkCount != 0
                          ? Modal(
                              post.id!,
                              "Kaydedenler",
                              ListCardBookMarkUsers(
                                postId: post.id!,
                                myuser: widget.myuser,
                              ))
                          : null;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget _listTitle(String username, String formattedDateTime) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _listUserName(username),
            _listTimeStamp(formattedDateTime)
          ],
        ),
      );

  Widget _listUserName(String username) => Wrap(
        direction: Axis.horizontal,
        runSpacing: 3,
        children: [
          Text(
            username,
            style: TextStyle(
                color: ColorConstants.whiteColor, fontWeight: FontWeight.w700),
          ),
        ],
      );
  Widget _listTimeStamp(String formattedDateTime) => Text(
        formattedDateTime,
        style:
            TextStyle(fontSize: 14, color: Color.fromRGBO(203, 208, 217, 1.0)),
      );

  final titleTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
}
