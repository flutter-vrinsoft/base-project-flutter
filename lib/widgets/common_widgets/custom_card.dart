import 'package:base_project_flutter/export.dart';

class CustomCard extends StatefulWidget {
  final Color? shadowColor;
  final double? borderRadius;
  final Color? backgroundColor;
  final Widget child;

  final bool? isGradientCard;
  final Color? primaryGradient;
  final Color? secondaryGradient;
  final Color? borderColor;
  final double? borderWidth;

  const CustomCard({
    super.key,
    this.shadowColor,
    this.borderRadius = 20,
    this.borderColor = ColorConst.kGray100Color,
    this.isGradientCard,
    this.primaryGradient,
    this.borderWidth,
    this.secondaryGradient,
    this.backgroundColor,
    required this.child,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(widget.borderRadius!),
        border: Border.all(width: widget.borderWidth ?? 1, color: widget.borderColor ?? Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor ?? Colors.transparent,
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(1, 4), // changes position of shadow
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
