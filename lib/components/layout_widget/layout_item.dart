import 'package:flutter/material.dart';
import '../../basic_config/my_icons.dart';
import '../../basic_core/pick_theme.dart';
import '../../basic_core/screen_adapter.dart';
import '../items_widget/tab_top_button.dart';

/// myAppBar生成方法
PreferredSizeWidget getMyAppBar(
  BuildContext context,
  double height,
  int current,
  void Function(int) callback,
) {
  ScreenAdapter.init(context);
  return PreferredSize(
    preferredSize: Size.fromHeight(ScreenAdapter.calcHeight(height)),
    child: AppBar(
      backgroundColor: DefaultTheme.tabs,
      elevation: 0,
      leading: InkWell(
        child: Icon(MyIcons.menu, size: ScreenAdapter.calcWidth(44), color: DefaultTheme.main),
        onTap: () {
          callback.call(0);
        },
      ),
      actions: [
        InkWell(
          child: Icon(MyIcons.search, size: ScreenAdapter.calcWidth(38), color: DefaultTheme.main),
          onTap: () {
            callback.call(4);
          },
        ),
        ScreenAdapter.getSizedBox(width: ScreenAdapter.calcWidth(10)),
      ],
      title: Container(
        width: ScreenAdapter.calcWidth(180),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.pinkAccent),
        ),
        child: Row(
          children: [
            Expanded(
              child: TabTopButton("小说", 1, callback, current: current == 1),
            ),
            Expanded(
              child: TabTopButton("漫画", 2, callback, current: current == 2),
            ),
            Expanded(
              child: TabTopButton("听书", 3, callback, current: current == 3),
            ),
          ],
        ),
      ),
      centerTitle: true,
    ),
  );
}


/// searchAppBar生成方法
/*
PreferredSizeWidget getSearchAppBar(
  BuildContext context,
    double height,
    int current
){
  return null;
}*/
