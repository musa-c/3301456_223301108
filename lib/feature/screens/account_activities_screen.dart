import 'package:abc/product/api/controllers/concrete/user_controller.dart';
import 'package:abc/product/constants/color_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../product/models/post_model.dart';
import '../../product/widgets/indicator.dart';

class AccountActivities extends StatefulWidget {
  User? myuser;
  AccountActivities({super.key, this.myuser});

  @override
  State<AccountActivities> createState() => _AccountActivitiesState();
}

class _AccountActivitiesState extends State<AccountActivities> {
  int touchedIndex = -1;
  User user = User();
  double percentageLike = 0;
  double percentageDislike = 0;
  double percentageComment = 0;
  double percentageBookMark = 0;

  void getUserById() async {
    UserController userController = UserController();
    User userdata = await userController.getUserById(widget.myuser!.id!);
    int total = userdata.likeCount! +
        userdata.dislikeCount! +
        userdata.bookMarkCount! +
        userdata.commentCount!;

    setState(() {
      user = userdata;
      percentageLike = (100 * user.likeCount!) / total;
      percentageDislike = (100 * user.dislikeCount!) / total;
      percentageComment = (100 * user.commentCount!) / total;
      percentageBookMark = (100 * user.bookMarkCount!) / total;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserById();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.3,
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Indicator(
                    color: ColorConstants.contentColorBlue,
                    text: 'Beğendiklerin',
                    isSquare: true,
                    textColor: ColorConstants.contentColorBlue,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: ColorConstants.contentColorYellow,
                    text: 'Beğenmediklerin',
                    isSquare: true,
                    textColor: ColorConstants.contentColorYellow,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: ColorConstants.contentColorPurple,
                    text: 'Kaydettiklerin',
                    isSquare: true,
                    textColor: ColorConstants.contentColorPurple,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: ColorConstants.contentColorGreen,
                    text: 'Yorumların',
                    isSquare: true,
                    textColor: ColorConstants.contentColorGreen,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
              const SizedBox(
                width: 28,
              ),
            ],
          ),
        )
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: ColorConstants.contentColorBlue,
            value: user.likeCount!.toDouble(),
            title: "%${percentageLike.toStringAsFixed(2)}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorConstants.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: ColorConstants.contentColorYellow,
            value: user.dislikeCount!.toDouble(),
            title: "%${percentageDislike.toStringAsFixed(2)}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorConstants.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: ColorConstants.contentColorPurple,
            value: user.bookMarkCount!.toDouble(),
            title: "%${percentageBookMark.toStringAsFixed(2)}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorConstants.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: ColorConstants.contentColorGreen,
            value: user.commentCount!.toDouble(),
            title: "%${percentageComment.toStringAsFixed(2)}",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ColorConstants.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
