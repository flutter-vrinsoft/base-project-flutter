import 'package:base_project_flutter/export.dart';

class CustomSvgImage extends StatelessWidget {
  final String logo;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;

  const CustomSvgImage({super.key, required this.logo, this.fit, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return color == null
        ? SvgPicture.asset(logo, fit: fit ?? BoxFit.scaleDown, width: width, height: height)
        : SvgPicture.asset(
            logo,
            fit: fit ?? BoxFit.scaleDown,
            width: width,
            height: height,
            colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
          );
  }
}
