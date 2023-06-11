// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';

import 'list_icon_widget.dart';

class ListProfileWidget extends StatefulWidget {
  const ListProfileWidget({super.key});

  @override
  State<ListProfileWidget> createState() => _ListProfileWidgetState();
}

class _ListProfileWidgetState extends State<ListProfileWidget> {
  final String _url = "https://picsum.photos/id/237/200/300";
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // String time() => {
  //   DateTime now = DateTime.now();
  //   String formattedTime = DateFormat('kk:mm:ss').format(now);
  //   return formattedTime.toString();
  // };

  @override
  Widget build(BuildContext context) {
    // if (userData.any((element) => element['username'] == widget.username)) {
    //   print(userData);
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: true,
        // floatingActionButton:
        //     widget.avatar != null ? null : _floatingActionButton,
        body: _listViewBuilder);
    // } else {
    //   return Scaffold(
    //     resizeToAvoidBottomInset: true,
    //     backgroundColor: Colors.black,
    //     floatingActionButton:
    //         widget.avatar != null ? null : _floatingActionButton,
    //     body: _text,
    //   );
    // }
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
                      // onChanged: (value) {
                      //   setState(() {
                      //     _textData = value;
                      //   });
                      //   // Metin değiştiğinde yapılacak işlemler
                      // },
                    ),
                  ),
                  // ButtonWidget(
                  //     onPressed: () {
                  //       userDataAdd();
                  //     },
                  //     child: Text("Gönder gitsin"))
                ],
              ));
        },
      );

  Widget get _listViewBuilder => ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return _listCont();
      });

  Widget _listCont() => Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: _listContBorder,
      ),
      child: _listTile());

  Border get _listContBorder => const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      top: BorderSide(width: 0),
      right: BorderSide(width: 0),
      left: BorderSide(width: 0));

  Widget _listTile() => ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      leading: _listAvatar(),
      subtitle: _listContext(),
      title: _listTitle());

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

  Widget _listContext() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "deneme post",
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
                  count: 4,
                  onTap: () {},
                ),
                ListIconWidget(
                  icon: Icons.arrow_upward_rounded,
                  count: 3,
                  onTap: () {},
                ),
                ListIconWidget(
                  icon: Icons.arrow_downward_rounded,
                  count: 2,
                  onTap: () {},
                ),
                ListIconWidget(
                  icon: Icons.bookmark_border_rounded,
                  count: 1,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      );

  Widget _listTitle() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_listUserName(), _listTimeStamp()],
        ),
      );

  Widget _listUserName() => Wrap(
        direction: Axis.horizontal,
        runSpacing: 3,
        children: [
          Text(
            "username",
            style: TextStyle(color: Colors.amber),
          ),
        ],
      );
  Widget _listTimeStamp() => Text(
        "time",
        style:
            TextStyle(fontSize: 14, color: Color.fromRGBO(203, 208, 217, 1.0)),
      );

  final titleTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
}
