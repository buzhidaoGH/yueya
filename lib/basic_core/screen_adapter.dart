import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 屏幕适配工具类封装;
/// 只要使用必须先调用init方法,传入BuildContext;
/// 使用 ScreenAdapter.init();ScreenUtil.xxx
abstract class ScreenAdapter {
  /// 返回屏幕适配后总高度
  static double screenHeight = ScreenUtil().screenHeight;

  /// 返回屏幕适配后总宽度
  static double screenWidth = ScreenUtil().screenWidth;

  /// 适配工具初始化,用于build函数传入context
  static void init(BuildContext context, {double designWidth = 375, double designHeight = 667}) {
    ScreenUtil.init(context, designSize: Size(designWidth, designHeight));
  }

  /// 通过设计稿宽度计算宽度
  static double calcWidth(double designWidth) {
    return ScreenUtil().setWidth(designWidth);
  }

  /// 通过设计稿高度计算宽度
  static double calcHeight(double designHeight) {
    return ScreenUtil().setHeight(designHeight);
  }

  /// 返回适配后的边框宽度(Only)
  static EdgeInsets edgeOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: calcWidth(left),
      top: calcHeight(top),
      right: calcWidth(right),
      bottom: calcHeight(bottom),
    );
  }

  /// 返回适配后的边框宽度(LTRB)
  static EdgeInsets edgeLTRB([
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  ]) {
    return EdgeInsets.fromLTRB(
      calcWidth(left),
      calcHeight(top),
      calcWidth(right),
      calcHeight(bottom),
    );
  }

  /// 返回适配后的边框宽度(All)
  static EdgeInsets edgeAll(double value) {
    return EdgeInsets.fromLTRB(
      calcWidth(value),
      calcHeight(value),
      calcWidth(value),
      calcHeight(value),
    );
  }

  /// 获取适配后的固定字体大小
  static double fontSize(num fontSize) {
    return ScreenUtil().setSp(fontSize);
  }

  /// 获取适配后的Size
  static Size getSize(double width, double height) {
    return Size(calcWidth(width), calcHeight(height));
  }

  /// 空位占取适配 SizedBox 默认宽高无限大
  static SizedBox getSizedBox({double width = double.infinity, double height = double.infinity}) {
    return SizedBox(width: calcWidth(width), height: calcHeight(width));
  }

  /// 获取分割线 Divider ;1为横向,-1为竖向;
  static StatelessWidget getDivider({
    int direction = -1,
    double size = 1,
    double thickness = 1,
    double indent = 0,
    double endIndent = 0,
    Color color = Colors.black38,
  }) {
    switch (direction) {
      case 1:
        return VerticalDivider(
          width: calcWidth(size),
          thickness: calcWidth(thickness),
          indent: calcHeight(indent),
          endIndent: calcHeight(endIndent),
          color: color,
        );
      case -1:
        return Divider(
          height: calcHeight(size),
          thickness: calcHeight(thickness),
          indent: calcWidth(indent),
          endIndent: calcWidth(endIndent),
          color: color,
        );
      default:
        throw Exception('direction只能传入1 or -1;');
    }
  }

  /// 相对于父组件来创建一个容器和定位;默认是全覆盖
  static RelativeRect relativeRectLTRB({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return RelativeRect.fromLTRB(
      calcWidth(left),
      calcHeight(top),
      calcWidth(right),
      calcHeight(bottom),
    );
  }

  /// TODO:定义一个容器,并指定容器大小和容器的对于父元素位置;
  static RelativeRect relativeRectSize(Rect rect, Rect container ) {
    return RelativeRect.fromRect(rect,container);
  }
}
