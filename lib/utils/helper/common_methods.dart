// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:base_project_flutter/export.dart';


bool notNull(Object? o) => o != null;

String toLabelValue(String key) {
  try {
    var str = key;
    // if (notNull(labelResponseModel.value.labels)) {
    //   LabelModel element = labelResponseModel.value.labels!.firstWhere((item) => item.key == key);
    //   return key;
    //   if (GetStringUtils(element.key.toString()).removeAllWhitespace.toLowerCase() ==
    //       key.removeAllWhitespace.toLowerCase()) {
    //     str = element.value ?? key;
    //   }
    // }

    return str;
  } catch (e) {
    debugPrint("toLabelValue($key) $e");
    return key;
  }
}

//Formatter For initial Space
class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }
    return newValue;
  }
}

dismissKeyboard() {
  FocusManager.instance.primaryFocus!.unfocus();
}

//get time to days conversion
extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return "just now";
    }
  }
}


// //Loader
// showLoader() => WidgetsBinding.instance.addPostFrameCallback((_) => _customLoader(Get.overlayContext!));
//
// void _customLoader(BuildContext? context) {
//   if (context != null) {
//     Loader.show(Get.overlayContext!,
//         isSafeAreaOverlay: true,
//         isBottomBarOverlay: true,
//         overlayFromBottom: 0,
//         overlayColor: ColorConst.kGray100Color.withOpacity(0.5),
//         progressIndicator: AnimatedContainer(
//           curve: Curves.easeInCirc,
//           duration: const Duration(milliseconds: 200),
//           child: const Icon(Icons.ac_unit, size: 40),
//           // child: SvgPicture.asset(ImageConstants.loader, height: 40, width: 40),
//         ),
//         // LoadingAnimationWidget.staggeredDotsWave(color: ColorConstants().primary, size: 50),
//         themeData: Theme.of(Get.overlayContext!)
//             .copyWith(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorConst.kPrimaryColor)));
//   }
// }
//
// showLoaderFromOwnContext(BuildContext context) {
//   return Loader.show(
//     context,
//     isSafeAreaOverlay: true,
//     isBottomBarOverlay: true,
//     overlayFromBottom: 0,
//     overlayColor: ColorConst.kGray100Color.withOpacity(0.5),
//     progressIndicator: AnimatedContainer(
//       curve: Curves.easeInCirc,
//       duration: const Duration(milliseconds: 200),
//       child: const Icon(Icons.ac_unit, size: 40),
//       // child: SvgPicture.asset(ImageConstants.loader, height: 40, width: 40),
//     ),
//     themeData: Theme.of(Get.overlayContext!).copyWith(
//       colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorConst.kPrimaryColor),
//     ),
//   );
// }
//
// hideLoader() {
//   Loader.hide();
// }
//
// //bottom sheet which container 2 strings and 2 buttons
// openBottomSheet(
//   context, {
//   String? svgImage,
//   required String title,
//   required String subTitle,
//   required String button1,
//   required String button2,
//   required VoidCallback button1Tap,
//   required VoidCallback button2Tap,
//   Color button1Background = ColorConst.kSecondaryColor,
//   Color button2Background = ColorConst.kPrimaryColor,
//   TextStyle? button1Style,
//   TextStyle? button2Style,
// }) {
//   return showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(25.0),
//         topRight: Radius.circular(25.0),
//       ),
//     ),
//     builder: (context) {
//       return ConstrainedBox(
//         constraints: const BoxConstraints(maxHeight: 400, minHeight: 80),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: paddingAll24,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   width: 30,
//                   height: 4,
//                   decoration: const BoxDecoration(
//                     color: ColorConst.kGray300Color,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                   ),
//                 ),
//                 gap16,
//                 if (svgImage != null)
//                   Column(
//                     children: [
//                       gap24,
//                       CustomSvgImage(logo: svgImage),
//                       gap24,
//                     ],
//                   ),
//                 CustomText(text: title, style: Theme.of(context).textTheme.headlineMedium),
//                 gap8,
//                 CustomText(
//                   text: subTitle,
//                   style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorConst.kGray300Color),
//                   textAlign: TextAlign.center,
//                 ),
//                 gap30,
//                 Row(
//                   children: [
//                     Expanded(
//                       child: CustomElevatedButton(
//                         onPressed: button1Tap,
//                         text: button1,
//                         backgroundColor: button1Background,
//                         textStyle: button1Style,
//                         padding: EdgeInsets.zero,
//                       ),
//                     ),
//                     gap16,
//                     Expanded(
//                       child: CustomElevatedButton(
//                         onPressed: button2Tap,
//                         text: button2,
//                         padding: EdgeInsets.zero,
//                         textStyle: button2Style,
//                         backgroundColor: button2Background,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
