import 'package:coin_market/core/utils/import.dart';
import 'package:coin_market/resources/colors.dart';

class AppBox extends StatelessWidget {
  const AppBox({
    super.key,
    this.bgColor = AppColors.transparent,
    required this.child,
    this.border = AppColors.neutral0,
  });
  final Color bgColor, border;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: border),
      ),
      child: child,
    );
  }
}
