// ignore_for_file: prefer_const_constructors
import 'package:abc/feature/screens/profile_screen.dart';
import 'package:abc/product/constants/color_constants.dart';
import 'package:abc/product/api/controllers/concrete/bookmark_controller.dart';
import 'package:abc/product/api/controllers/concrete/dislike_controller.dart';
import 'package:abc/product/api/controllers/concrete/likes_controller.dart';
import 'package:abc/product/api/controllers/concrete/post_controller.dart';
import 'package:abc/product/models/post_model.dart';
import 'package:abc/product/widgets/list_card_bookmarkusers_widget.dart';
import 'package:abc/product/widgets/list_card_dislikeusers_widget.dart';
import 'package:abc/product/widgets/list_card_likeusers_widget.dart';
import 'package:abc/product/widgets/list_commentusers_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'list_icon_widget.dart';
// import 'package:animated_icon/animate_icons.dart';
import 'package:http/http.dart' as http;

class ListBuilderWidget extends StatefulWidget {
  User user = User();
  ListBuilderWidget({super.key, required this.user});

  @override
  State<ListBuilderWidget> createState() => _ListBuilderWidgetState();
}

class _ListBuilderWidgetState extends State<ListBuilderWidget> {
  List<Post>? posts = [];
  bool isLoading = false;

  bool isUserIdLike(List<Likes>? likesList) {
    if (likesList == null) return false;
    return likesList.any((like) => like.userId == widget.user.id);
  }

  bool isUserIdDislike(List<Dislikes>? dislikesList) {
    if (dislikesList == null) return false;
    return dislikesList.any((dislike) => dislike.userId == widget.user.id);
  }

  bool isUserIdBookMark(List<BookMarks>? bookMarkesList) {
    if (bookMarkesList == null) return false;
    return bookMarkesList.any((bookMark) => bookMark.userId == widget.user.id);
  }

  void setLike(int postId) async {
    int userId = widget.user.id!;
    final http.Response response;
    LikeController likeController = LikeController();
    try {
      response = await likeController.createLike(userId, postId);
      if (response.statusCode == 200 || response.statusCode == 204) {
        PostController postController = PostController();
        Post updatePost = await postController.getPostById(postId);
        int index = posts!
            .indexOf(posts!.firstWhere((element) => element.id == postId));

        setState(() {
          posts![index] = updatePost;
        });
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
    int userId = widget.user.id!;
    final http.Response response;
    DislikesController dislikesController = DislikesController();
    try {
      response = await dislikesController.createDislike(userId, postId);

      if (response.statusCode == 200 || response.statusCode == 204) {
        PostController postController = PostController();
        Post updatePost = await postController.getPostById(postId);
        int index = posts!
            .indexOf(posts!.firstWhere((element) => element.id == postId));

        setState(() {
          posts![index] = updatePost;
        });
      } else {
        print("hata");
      }
    } catch (e) {
      print(e);
    }
  }

  void setBookMark(int postId) async {
    int userId = widget.user.id!;
    final http.Response response;
    BookMarkController bookMarkController = BookMarkController();
    try {
      response = await bookMarkController.createBookMark(userId, postId);
      if (response.statusCode == 200 || response.statusCode == 204) {
        PostController postController = PostController();
        Post updatePost = await postController.getPostById(postId);
        int index = posts!
            .indexOf(posts!.firstWhere((element) => element.id == postId));

        setState(() {
          posts![index] = updatePost;
        });

        // getPost();
      } else {
        print("hata");
      }
    } catch (e) {
      print(e);
    }
  }

  void getPost() async {
    setState(() {
      isLoading = true;
    });
    PostController postController = PostController();
    try {
      List<Post> postList = await postController.getAll();
      if (mounted) {
        setState(() {
          posts = postList;
        });
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("hataxxx:  $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      getPost();
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   getPost();
  // }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: posts!.length,
            itemBuilder: (BuildContext context, int index) {
              Post post = posts![index];
              DateTime dateTime = DateTime.parse(post.timeStamp!);
              String formattedDateTime =
                  DateFormat('dd.MM.yyyy HH:mm').format(dateTime);
              return _listCont(post, formattedDateTime);
            });
  }

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
      leading: _listAvatar(post.user!),
      subtitle: _listContext(post),
      title: _listTitle(post.user!.userName!, formattedDateTime));

  Widget _listAvatar(User user) => Container(
      height: double.infinity,
      // ignore: sized_box_for_whitespace
      margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
      child: _listAvatarChilt(user));

  Widget _listAvatarChilt(User user) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              // settings: RouteSettings(arguments: {"user": user}),
              fullscreenDialog: false,
              builder: (context) => Scaffold(
                  appBar: AppBar(
                    bottom: _appBarDivider,
                    backgroundColor: Colors.black,
                    title: Text("Profil"),
                  ),
                  body: ProfileView(
                    user: user,
                    myuser: widget.user,
                  )),
            ));
      },
      child: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage("assets/avatars/${user.avatar}.jpg"),
      ));

  Widget _listCartUserName(String username) => Text(
        username,
        style: titleTextStyle,
      );

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

  Widget _listContext(Post post) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.text!,
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
                    onTap: () {
                      Modal(
                          post.id!,
                          "Yorumlar",
                          ListCommentUserWidget(
                            postId: post.id!,
                            myuser: widget.user,
                          ));
                    }),
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
                    Modal(
                        post.id!,
                        "Beğenenler",
                        ListCardLikeUsers(
                          postId: post.id!,
                          myuser: widget.user,
                        ));
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
                              myuser: widget.user,
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
                              myuser: widget.user,
                            ))
                        : null;
                  },
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
            style: TextStyle(color: ColorConstants.whiteColor),
          )
        ],
      );
  Widget _listTimeStamp(String formattedDateTime) => Text(
        formattedDateTime,
        style: TextStyle(fontSize: 14, color: ColorConstants.timeStampColor),
      );

  final titleTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ColorConstants.whiteColor);

  PreferredSize get _appBarDivider => PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: ColorConstants.dividerColor,
        ),
      );
}
