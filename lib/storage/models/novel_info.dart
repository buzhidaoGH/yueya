/// 小说基本信息
class NovelBaseInfo {
  String? id;
  String? name;
  String? author;
  String? img;
  String? desc;
  String? bookStatus;
  String? lastChapterId;
  String? lastChapter;
  String? cName;
  String? updateTime;
  String? weekHitCount;
  String? monthHitCount;
  String? hitCount;

  NovelBaseInfo({
    this.id,
    this.name,
    this.author,
    this.img,
    this.desc,
    this.bookStatus,
    this.lastChapterId,
    this.lastChapter,
    this.cName,
    this.updateTime,
    this.weekHitCount,
    this.monthHitCount,
    this.hitCount,
  });

  NovelBaseInfo.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    author = json['Author'];
    img = json['Img'];
    desc = json['Desc'];
    bookStatus = json['BookStatus'];
    lastChapterId = json['LastChapterId'];
    lastChapter = json['LastChapter'];
    cName = json['CName'];
    updateTime = json['UpdateTime'];
    weekHitCount = json['weekHitCount'];
    monthHitCount = json['monthHitCount'];
    hitCount = json['hitCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Author'] = author;
    data['Img'] = img;
    data['Desc'] = desc;
    data['BookStatus'] = bookStatus;
    data['LastChapterId'] = lastChapterId;
    data['LastChapter'] = lastChapter;
    data['CName'] = cName;
    data['UpdateTime'] = updateTime;
    data['weekHitCount'] = weekHitCount;
    data['monthHitCount'] = monthHitCount;
    data['hitCount'] = hitCount;
    return data;
  }
}

/// 小说所有章节信息
class Chapters {
  int? id;
  String? name;
  List<ChapterInfo>? chapter;

  Chapters({this.id, this.name, this.chapter});

  Chapters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['chapter'] != null) {
      chapter = <ChapterInfo>[];
      json['chapter'].forEach((v) {
        chapter!.add(ChapterInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (chapter != null) {
      data['chapter'] = chapter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// 单章基本信息
class ChapterInfo {
  int? id;
  String? name;
  int? hasContent;

  ChapterInfo({this.id, this.name, this.hasContent});

  ChapterInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hasContent = json['hasContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['hasContent'] = hasContent;
    return data;
  }
}

/// 小说单章内容
class ChapterContent {
  int? id; // 小说id
  String? name; // 小说名称
  int? cid; // 本章节id
  String? cname; // 本章节标题
  int? pid; // 上一章id
  int? nid; // 下一章id
  String? content; // 小说文本内容
  int? hasContent; // 是否有内容(有效内容)

  ChapterContent({
    this.id,
    this.name,
    this.cid,
    this.cname,
    this.pid,
    this.nid,
    this.content,
    this.hasContent,
  });

  ChapterContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cid = json['cid'];
    cname = json['cname'];
    pid = json['pid'];
    nid = json['nid'];
    content = json['content'];
    hasContent = json['hasContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['cid'] = cid;
    data['cname'] = cname;
    data['pid'] = pid;
    data['nid'] = nid;
    data['content'] = content;
    data['hasContent'] = hasContent;
    return data;
  }
}
