import 'dart:ui';

class ColorConst {
  static const kPrimaryColor = Color(0xFFF89939);
  static const kSecondaryColor = Color(0xFF9AD7D4);

  static const kWhiteColor = Color(0xFFFFFFFF);
  static const kBlackColor = Color(0xFF000000);
  static const kGray100Color = Color(0xFFC7C7C7);
  static const kGray200Color = Color(0xFF6D6D6D);
  static const kGray300Color = Color(0xFF474747);

  static const kGrayDisableColor = Color(0xFFE5E5E5); //disableColor
  static const kDarkBlueColor = Color(0xFF0B1520);
  static const kGreenColor = Color(0xFF39A31E);
  static const kRedColor = Color(0xFFD72929);
  static const kTabBGColor = Color(0xFF0B0B0B);
  static const kPurpleColor = Color(0xFFE1E2F3);
  static const kGreyColor = Color(0xFF5D5E65);

  static const kLightRedColor = Color.fromRGBO(245, 183, 183, 1.0);
}

/// Color convertor
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
