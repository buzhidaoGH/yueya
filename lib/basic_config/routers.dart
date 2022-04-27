import 'package:flutter/material.dart';
import '../components/views_widget/search.dart';

/// routes 配置路由 Map<String, WidgetBuilder>
final Map<String, WidgetBuilder> routerMap = {
  'unit': (context) => const _UnitPage(),
  'search': (context) => const SearchPage()
};

class _UnitPage extends StatelessWidget {
  const _UnitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('执行时机build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('RouteUnit测试页面'),
        centerTitle: true,
      ),
      body: const Text('RouteUnit测试页面内容'),
    );
  }
}
