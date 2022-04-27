import 'package:flutter/material.dart';
import '../../basic_config/my_icons.dart';
import '../mine/mine.dart';
import '../bookcity/bookcity.dart';
import '../bookshelf/bookshelf.dart';


/// 主要页面Widget数组
List<Widget> homePageList = [
  const BookShelfPage(),
  const BookCityPage(),
  const MinePage(),
];

/// tabs的切换数组BarItem
List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(icon: Icon(MyIcons.bookshelf), label: '书架'),
  const BottomNavigationBarItem(icon: Icon(MyIcons.bookcity), label: '书城'),
  const BottomNavigationBarItem(icon: Icon(MyIcons.mine), label: '我的'),
];
