import 'package:base_project_flutter/export.dart';

class CustomDivider extends StatelessWidget {
  final double padding;
  final double? lineHeight;
  final double? lineWidth;
  final Color? backgroundColor;
  const CustomDivider({super.key, this.lineHeight = 1, this.backgroundColor, this.lineWidth, this.padding = 24});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Container(
        color: backgroundColor != null ? backgroundColor! : ColorConst.kGray100Color.withOpacity(.20),
        height: lineHeight,
        width: lineWidth ?? context.size!.width,
      ),
    );
  }
}
