import 'package:base_project_flutter/export.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final double? fontSize;
  final Color? fontColor;
  final Color? backgroundColor;
  final TextDecoration? fontDecoration;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    this.text,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.fontColor,
    this.fontDecoration,
    this.backgroundColor,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class CustomTitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const CustomTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          style: titleStyle ?? Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        CustomText(
          text: subtitle,
          style: subtitleStyle ?? Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class CustomTitleDownloadButton extends StatelessWidget {
  final String title;
  final String downloadTitle;
  final TextStyle? titleStyle;
  final Color color;
  final Function() onTap;

  const CustomTitleDownloadButton({
    super.key,
    required this.title,
    required this.onTap,
    this.downloadTitle = LabelConst.downloadLabel,
    this.titleStyle,
    this.color = ColorConst.kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title, style: titleStyle ?? Theme.of(context).textTheme.bodyLarge),
        CustomUnderLineText(onTap: onTap, title: downloadTitle, color: color)
      ],
    );
  }
}

class CustomUnderLineText extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color color;

  const CustomUnderLineText({
    super.key,
    required this.title,
    required this.onTap,
    this.color = ColorConst.kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomText(
        text: title,
        style: context.textTheme.bodyLarge!.copyWith(
          color: Colors.transparent,
          decoration: TextDecoration.underline,
          decorationColor: color,
          shadows: [Shadow(color: color, offset: const Offset(0, -1.5))],
        ),
      ),
    );
  }
}

class NoDataView extends StatelessWidget {
  const NoDataView({super.key, required this.msg, this.msg1, this.heightMultiplier = 0.1});

  final String msg;
  final String? msg1;
  final double heightMultiplier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * heightMultiplier,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CustomText(
            //   text: toLabelValue(msg),
            //   maxLines: 2,
            //   fontWeight: FontWeight.w600,
            //   fontColor: AppColors.bottomBlack,
            //   fontSize: getFontSize(16),
            // ),
            // if (msg1 != null) ...[
            //   const SizedBox(height: 5),
            //   CustomText(
            //     text: toLabelValue(msg1!),
            //     maxLines: 2,
            //     fontWeight: FontWeight.w600,
            //     fontColor: AppColors.bottomBlack,
            //     fontSize: getFontSize(16),
            //   ),
            // ]
          ],
        ),
      ),
    );
  }
}
