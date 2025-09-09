import 'package:flutter/cupertino.dart';
import 'package:coin_market/resources/colors.dart';


class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.alignment = Alignment.center,
    this.color = AppColors.white,
    this.radius = 10,
  });

  final AlignmentGeometry alignment;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: CupertinoActivityIndicator(
        radius: radius,
        color: color,
      ),
    );
  }
}
