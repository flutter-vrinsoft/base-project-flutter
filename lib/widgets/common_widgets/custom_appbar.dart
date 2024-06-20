// ignore_for_file: library_private_types_in_public_api

import 'package:base_project_flutter/export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isBackVisible;
  final VoidCallback? onBack;
  final String? backWidgetIcon;
  final FontWeight? fontWeight;
  final Color? backIconColor;
  final double? titleFontSize;
  final Color? titleColor;
  final Widget? secondTrailing;
  final Color? backgroundColor;
  final Widget? firstTrailing;
  final Widget? firstLeading;
  final Widget? thirdTrailing;
  final bool? isFromDashBoard;
  final Widget? searchBar;
  final bool showAppbarLine;
  final bool? isCenterTitle;
  final TextStyle? textStyle;
  final Widget? isTitleWidget;
  final VoidCallback? onSecondOnclick;
  final VoidCallback? onThirdOnclick;
  final VoidCallback? onFirstOnclick;
  final bool? isGradientAppBar;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.titleColor,
    this.searchBar,
    this.isCenterTitle = false,
    this.textStyle,
    this.isFromDashBoard = false,
    this.firstLeading,
    this.isTitleWidget,
    this.backIconColor,
    this.isGradientAppBar = false,
    this.showAppbarLine = false,
    required this.title,
    this.titleFontSize,
    this.backWidgetIcon,
    this.onThirdOnclick,
    this.thirdTrailing,
    this.bottom,
    this.secondTrailing,
    this.isBackVisible = false,
    this.backgroundColor,
    this.onBack,
    this.fontWeight = FontWeight.normal,
    this.firstTrailing,
    this.onSecondOnclick,
    this.onFirstOnclick,
  });

  @override
  Size get preferredSize => size56;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
      child: Column(
        children: [
          AppBar(
            bottom: bottom,
            systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: ColorConst.kBlackColor,
              systemNavigationBarIconBrightness: Brightness.light,
              statusBarColor: ColorConst.kWhiteColor,
              statusBarIconBrightness: Brightness.dark,
            ),
            titleSpacing: isBackVisible == true ? 0.0 : 24,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            centerTitle: isCenterTitle,
            scrolledUnderElevation: 0,
            leading: isBackVisible!
                ? InkWell(
                    onTap: onBack ??
                        () {
                          dismissKeyboard();
                          Navigator.of(context).pop();
                        },
                    child: CustomSvgImage(
                      logo: backWidgetIcon ?? ImageConst.imgAppLogo,
                      height: 50,
                      width: 50,
                    ),
                  )
                : null,
            title: title != ""
                ? SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: (isCenterTitle ?? false) ? 10 : 0),
                      child: CustomText(
                        text: title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: isCenterTitle! ? TextAlign.center : TextAlign.left,
                        style: textStyle ??
                            Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                : CustomSvgImage(
                    logo: backWidgetIcon ?? ImageConst.imgAppLogo,
                    // height: 50,
                    // width: 50,
                  ),
            actions: <Widget>[
              thirdTrailing != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 24.0, left: 10),
                      child: InkWell(
                        onTap: onThirdOnclick,
                        child: thirdTrailing,
                      ))
                  : const SizedBox(),
              secondTrailing != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 10),
                      child: InkWell(
                        onTap: onSecondOnclick,
                        child: secondTrailing,
                      ))
                  : const SizedBox(),
              firstTrailing != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 24.0, left: 8),
                      child: InkWell(
                        onTap: onFirstOnclick,
                        child: firstTrailing,
                      ))
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
