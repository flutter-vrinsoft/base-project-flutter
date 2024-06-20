import 'package:base_project_flutter/export.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isEnabled;
  final double height;
  final double width;
  final double? fontSize;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets padding;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isEnabled = true,
    this.height = 52.0,
    this.fontSize,
    this.foregroundColor,
    this.width = double.infinity, // Default width to take full available width
    this.textStyle,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: backgroundColor != null
              ? ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(backgroundColor),
                  foregroundColor: MaterialStateProperty.all(foregroundColor))
              : null,
          onPressed: isEnabled ? onPressed : null,
          child: CustomText(
            text: text,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: foregroundColor ?? ColorConst.kDarkBlueColor, fontSize: fontSize ?? 16),
          ),
        ),
      ),
    );
  }
}

// class DashedButtonWidget extends StatelessWidget {
//   final String title;
//   final GestureTapCallback onTap;
//   final EdgeInsetsGeometry? padding;
//
//   const DashedButtonWidget({
//     super.key,
//     required this.title,
//     required this.onTap,
//     this.padding,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: DottedBorder(
//         borderType: BorderType.RRect,
//         color: Theme.of(context).dividerColor,
//         padding: paddingAll16,
//         dashPattern: const [6, 6],
//         strokeWidth: 1,
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             children: [
//               const CustomSvgImage(logo: ImageConst.icUpload),
//               gap8,
//               Center(
//                 child: CustomText(
//                   text: title,
//                   style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorConst.kGray200Color),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
