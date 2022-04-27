import 'package:flutter/material.dart';
import '../../basic_config/my_icons.dart';
import '../../basic_core/pick_theme.dart';
import '../../basic_core/screen_adapter.dart';
import '../../storage/models/novel_info.dart';
import '../../utils/http_util.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Map<String, dynamic>? args;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<NovelBaseInfo> novelList = [];

  @override
  void initState() {
    super.initState();
  }

  _searchMethod() {
    switch (args?['index']) {
      case 1:
        _searchNovelInfoList(controller.text);
        break;
      default:
        print(controller.text);
    }
  }

  _searchNovelInfoList(String title) {
    novelTitle(title).then((value) {
      setState(() {
        novelList = value;
      });
    });
  }

  Widget _renderBody() {
    if (novelList.isEmpty) {
      switch (args?['index']) {
        case 1:
          return Text('小说默认页面');
        case 2:
          return Text('漫画默认页面');
        case 3:
          return Text('听书默认页面');
        default:
          return Text('非小说数据');
      }
    }
    switch (args?['index']) {
      case 1:
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: ScreenAdapter.calcHeight(120),
              margin: ScreenAdapter.edgeAll(10),
              child: Row(
                children: [
                  Image.network(
                    novelList[index].img!,
                    errorBuilder: (context, error, sta) {
                      return Image.asset('res/assets/images/no_cover_yet.png');
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(novelList[index].name!),
                      Text(novelList[index].cName!),
                      Text(novelList[index].author!),
                      SizedBox(
                        width: ScreenAdapter.calcWidth(250),
                        height: 50,
                        child: Text('\u3000\u3000${novelList[index].desc!.substring(0, 40)}',
                            maxLines: 2,overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: novelList.length,
        );
      default:
        return Text('非小说数据');
    }
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    ScreenAdapter.init(context);
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: DefaultTheme.tabs,
          elevation: 0,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              size: ScreenAdapter.calcWidth(28),
              color: DefaultTheme.main,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            padding: ScreenAdapter.edgeAll(5),
            margin: ScreenAdapter.edgeAll(5),
            child: Row(
              children: [
                SizedBox(
                  width: ScreenAdapter.calcWidth(60),
                  child: DropdownButton<int>(
                    elevation: 0,
                    value: args?['index'],
                    iconSize: 24,
                    onChanged: (newValue) {
                      setState(() {
                        novelList = [];
                        args?['index'] = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text(
                          '小说',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text(
                          '漫画',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text(
                          '听书',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ScreenAdapter.getSizedBox(width: 10),
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              child:
                  Icon(MyIcons.search, size: ScreenAdapter.calcWidth(38), color: DefaultTheme.main),
              onTap: _searchMethod,
            ),
            ScreenAdapter.getSizedBox(width: ScreenAdapter.calcWidth(10)),
          ],
        ),
        preferredSize: ScreenAdapter.getSize(double.infinity, 44),
      ),
      body: _renderBody(),
    );
  }
}
