import 'package:flutter/material.dart';
import '../../basic_core/screen_adapter.dart' show ScreenAdapter;
import 'tabs_config.dart';
import '../../basic_config/constant.dart' show homePageIndex;
import '../../basic_core/pick_theme.dart' show DefaultTheme;
import '../../components/layout_widget/layout_item.dart' show getMyAppBar;

class HomeTabs extends StatefulWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int _currentIndex = homePageIndex;
  int _currentCategory = 1;
  final List<Widget> _homePageList = homePageList;
  final List<BottomNavigationBarItem> _barItemList = barItemList;

  void callback(int value) {
    if (value >= 1 && value <= 3) {
      setState(() {
        _currentCategory = value;
      });
    }
    if(value==4){
      Navigator.pushNamed(context, 'search',arguments: {'index':_currentCategory});
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: _currentIndex != 2 ? getMyAppBar(context, 44, _currentCategory, callback) : null,
      body: _homePageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DefaultTheme.tabs,
        currentIndex: _currentIndex,
        items: _barItemList,
        selectedItemColor: DefaultTheme.selected,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
