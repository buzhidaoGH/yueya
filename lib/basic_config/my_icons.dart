import 'package:flutter/material.dart';
abstract class MyIcons {
  MyIcons._();

  static const _kFontFam = 'MyIcons';
  static const String? _kFontPkg = null;

  static const IconData bookcity = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bookshelf = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menu = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData mine = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData search = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
