import 'dart:convert';
import 'package:dio/dio.dart';
import '../storage/models/novel_info.dart';

/// 小说标题模糊查询相关所有小说基本信息
Future<List<NovelBaseInfo>> novelTitle(String title) async {
  Response response = await Dio().get(
    'https://souxs.leeyegy.com/search.aspx?siteid=app2',
    queryParameters: {
      "key": title,
    },
  );
  List<NovelBaseInfo> novelList = [];
  for (var item in jsonDecode(response.data)['data']) {
    novelList.add(NovelBaseInfo.fromJson(item));
  }
  return novelList;
}

/// 通过小说id来查询此小说所有章节信息
Future<Chapters> chapterInfoList(String nid) async {
  int id = int.parse(nid);
  int handlerId = id ~/ 1000;
  Response response =
      await Dio().get('https://infosxs.pysmei.com/BookFiles/Html/${handlerId + 1}/$id/index.html');
  String result = response.data;
  RegExp postalCode = RegExp(r'at character (\d*)');
  Map<String, dynamic> resultMap = {};
  bool flag = true;
  while (flag) {
    flag = false;
    try {
      resultMap = jsonDecode(result) as Map<String, dynamic>;
    } catch (e) {
      flag = true;
      RegExpMatch? m = postalCode.firstMatch(e.toString());
      int index;
      if (m != null) {
        index = int.parse(m.group(1)!);
        List temp = result.split('');
        temp.removeAt(index - 2);
        result = temp.join();
      }
    }
  }
  Map<String, dynamic> resultDataMap = {};
  resultDataMap['id'] = resultMap['data']['id'];
  resultDataMap['name'] = resultMap['data']['name'];
  List chapters = [];
  for (var items in resultMap['data']['list']) {
    for (var item in items['list']) {
      chapters.add(item);
    }
  }
  resultDataMap['chapter'] = chapters;
  return Chapters.fromJson(resultDataMap);
}

/// 通过小说id和文章id查询章节内容
Future<ChapterContent> chapterContentSearch(String nid, String cid) async {
  int id = int.parse(nid);
  int handlerId = id ~/ 1000;
  Response response =
      await Dio().get('https://infosxs.pysmei.com/BookFiles/Html/${handlerId + 1}/$id/$cid.html');
  return ChapterContent.fromJson(jsonDecode(response.data)["data"]);
}
