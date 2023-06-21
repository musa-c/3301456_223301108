import 'package:flutter/material.dart';

class ListIconWidget extends StatefulWidget {
  final IconData icon;
  final Color? color;
  final int? count;
  final Function? onTap;
  final Function? onTapUser;
  final double? size;

  const ListIconWidget({
    super.key,
    required this.icon,
    this.color,
    this.count,
    this.onTap,
    this.onTapUser,
    this.size,
  });

  @override
  State<ListIconWidget> createState() => ListIconWidgetState();
}

class ListIconWidgetState extends State<ListIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final double _iconSize = 14;

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this
        // sayfanın dikey senkronizayonunu sağlanması için vysnc: this.

        /* 
      Animasyonları kontrol etmek için kullanılan bir sınıftır. 
      Bu durumda, animasyonun süresi 1000 milisaniye (1 saniye) olarak ayarlanmıştır.
      */
        );

    _animation = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.ease),
      /* 
       Bu, animasyonun boyutunu değiştirmek için kullanılan bir faktördür.
      */
    );

    _animationController.addStatusListener((status) {
      // durum dinleyicisi animasyon tamamlandıysa tersine çevririr. böylece animasyon tekrarlanır.
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }

  // initin tam tersinidir. state ile ilişki sona erildiğinde çalışır.

  void _toggleAnimation() {
    if (_animationController.isAnimating) {
      return;
    }

    // setState(() {
    //   _iconSize =
    //       14; // İlk değere geri dönmesi için _iconSize'ı 14 olarak ayarlayın
    // });

    // animasyonu başlatır.
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: [
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return InkWell(
              onTap: () {
                _toggleAnimation();
                widget.onTap!() ?? () {};
              },
              child: Transform.scale(
                scale: _animation.value,
                child: Icon(
                  widget.icon,
                  color: widget.color ?? _getFooterColor(),
                  size: _iconSize,
                ),
              ),
            );
          },
        ),
        InkWell(
          onTap: widget.onTapUser as void Function()?,
          child: _buildListIconText(),
        ),
      ],
    );
  }

  Color _getFooterColor() {
    return const Color.fromRGBO(85, 90, 100, 1.0);
  }

  Widget _buildListIconText() {
    return Text(
      widget.count.toString(),
      style: TextStyle(color: _getFooterColor()),
    );
  }
}
