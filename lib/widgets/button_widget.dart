import 'package:flutter/material.dart';

// loginButton
class ButtonWidget extends StatelessWidget {
  Function onPressed;
  Widget child;
  // Widget? icon;
  // Widget? label;
  ButtonWidget({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[300],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: () {
          onPressed();
        },
        child: child,
      ),
    );
  }

  static Widget Icon(
          Widget icon, Widget label, Color backgroudColor, Function()? onpress,
          {BorderSide borderSide = BorderSide.none}) =>
      SizedBox(
        width: 380,
        height: 44,
        child: ElevatedButton.icon(
          onPressed: onpress ?? () {}, // nul gelirse boş fonksiyon dön.
          icon: icon,
          label: label,
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroudColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), side: borderSide)),
        ),
      );

  static Widget textBtn(Function()? onPress, Widget child) =>
      TextButton(onPressed: onPress, child: child);
}
