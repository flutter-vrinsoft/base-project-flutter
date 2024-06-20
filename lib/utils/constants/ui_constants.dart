import 'package:base_project_flutter/export.dart';

//Time delay
Duration get delay1 => const Duration(seconds: 1);
Duration get delay2 => const Duration(seconds: 2);
Duration get delay5 => const Duration(seconds: 5);
Duration get delay10 => const Duration(seconds: 10);

//Size
Size get size2 => const Size.fromHeight(2);
Size get size56 => const Size.fromHeight(56.0);

//SizedBox
const SizedBox gap2 = SizedBox(height: 2, width: 2);
const SizedBox gap4 = SizedBox(height: 4, width: 4);
const SizedBox gap6 = SizedBox(height: 6, width: 6);
const SizedBox gap8 = SizedBox(height: 8, width: 8);
const SizedBox gap10 = SizedBox(height: 10, width: 10);
const SizedBox gap12 = SizedBox(height: 12, width: 12);
const SizedBox gap14 = SizedBox(height: 14, width: 14);
const SizedBox gap16 = SizedBox(height: 16, width: 16);
const SizedBox gap18 = SizedBox(height: 18, width: 18);
const SizedBox gap20 = SizedBox(height: 20, width: 20);
const SizedBox gap22 = SizedBox(height: 22, width: 22);
const SizedBox gap24 = SizedBox(height: 24, width: 24);
const SizedBox gap28 = SizedBox(height: 28, width: 28);
const SizedBox gap30 = SizedBox(height: 30, width: 30);
const SizedBox gap32 = SizedBox(height: 32, width: 32);
const SizedBox gap36 = SizedBox(height: 36, width: 36);
const SizedBox gap40 = SizedBox(height: 40, width: 40);
const SizedBox gap48 = SizedBox(height: 48, width: 48);
const SizedBox gap50 = SizedBox(height: 40, width: 40);
const SizedBox gap60 = SizedBox(height: 40, width: 40);
const SizedBox gap80 = SizedBox(height: 40, width: 40);
const SizedBox gap100 = SizedBox(height: 100, width: 100);
const SizedBox gap200 = SizedBox(height: 200, width: 200);
SizedBox gap(double size) => SizedBox(height: size, width: size);
SizedBox hgap(double size) => SizedBox(width: size);
SizedBox vgap(double size) => SizedBox(height: size);

// EdgeInsets
const EdgeInsets p4 = EdgeInsets.all(4);
const EdgeInsets p8 = EdgeInsets.all(8);
const EdgeInsets p12 = EdgeInsets.all(12);
const EdgeInsets p16 = EdgeInsets.all(16);
const EdgeInsets p24 = EdgeInsets.all(24);
const EdgeInsets p32 = EdgeInsets.all(32);
const EdgeInsets p48 = EdgeInsets.all(48);
EdgeInsets pad(double padding) => EdgeInsets.all(padding);

const EdgeInsets px4 = EdgeInsets.symmetric(horizontal: 4);
const EdgeInsets px8 = EdgeInsets.symmetric(horizontal: 8);
const EdgeInsets px12 = EdgeInsets.symmetric(horizontal: 12);
const EdgeInsets px16 = EdgeInsets.symmetric(horizontal: 16);
const EdgeInsets px24 = EdgeInsets.symmetric(horizontal: 24);
const EdgeInsets px32 = EdgeInsets.symmetric(horizontal: 32);
const EdgeInsets px48 = EdgeInsets.symmetric(horizontal: 48);
EdgeInsets padX(double paddingX) => EdgeInsets.symmetric(horizontal: paddingX);

const EdgeInsets py4 = EdgeInsets.symmetric(vertical: 4);
const EdgeInsets py8 = EdgeInsets.symmetric(vertical: 8);
const EdgeInsets py12 = EdgeInsets.symmetric(vertical: 12);
const EdgeInsets py16 = EdgeInsets.symmetric(vertical: 16);
const EdgeInsets py24 = EdgeInsets.symmetric(vertical: 24);
const EdgeInsets py32 = EdgeInsets.symmetric(vertical: 32);
const EdgeInsets py48 = EdgeInsets.symmetric(vertical: 48);
EdgeInsets padY(double paddingY) => EdgeInsets.symmetric(horizontal: paddingY);
