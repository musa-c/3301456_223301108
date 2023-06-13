// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:abc/product/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'button_widget.dart';
import 'list_icon_widget.dart';

class ListProfileWidget extends StatefulWidget {
  User? user;
  User? myuser;
  ListProfileWidget({super.key, this.myuser, this.user});

  @override
  State<ListProfileWidget> createState() => _ListProfileWidgetState();
}

class _ListProfileWidgetState extends State<ListProfileWidget> {
  final String _url = "https://picsum.photos/id/237/200/300";
  final TextEditingController _textController = TextEditingController();
  List<Post>? posts = [];

  @override
  void initState() {
    super.initState();
    getPost();
  }

  String textvalue = "";

  void createPost(String text) async {
    final http.Response response;
    try {
      response = await http.post(
          Uri.parse(
              'http://localhost:26342/api/posts/CreatePost/${widget.myuser!.id}'),
          body: jsonEncode({'text': text}),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        print("başarılı");
        getPost();
      } else {
        print("başarısız.");
      }
    } catch (e) {
      print(e);
    }
  }

  void getPost() async {
    final http.Response response;
    try {
      response = await http.get(Uri.parse(
          'http://localhost:26342/api/posts/GetPostByUserId/${widget.myuser!.id}'));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<Post> postList =
            jsonResponse.map((item) => Post.fromJson(item)).toList();
        print("başarılı");
        setState(() {
          posts = postList;
        });
      } else {
        print("başarısız.");
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
                        createPost(textvalue);
                      },
                      child: Text("Gönder gitsin"))
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
      title: _listTitle(widget.myuser!.userName!, formattedDateTime));

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

  Widget _listContext(Post post) => Column(
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
                  onTap: () {},
                ),
                ListIconWidget(
                  icon: Icons.arrow_downward_rounded,
                  count: post.dislikeCount,
                  onTap: () {},
                ),
                ListIconWidget(
                  icon: Icons.bookmark_border_rounded,
                  count: post.bookMarkCount,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
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
            style: TextStyle(color: Colors.amber),
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
