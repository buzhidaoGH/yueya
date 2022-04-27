import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageUtil {
  static SharedPreferences? _sharedPreferences;

  /// 使用同步获取方法,必须先调用initSync方法初始化;且只能同步获取
  static Future<bool> initSync() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }

  /// 异步通过 key 删除键值对
  static Future<bool> remove(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.remove(key);
  }

  /// 异步清除所有添加数据
  static Future<bool> clearAll() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }

  /// 异步获取所有Set集合keys
  static Future<Set<String>> getKeysAsync() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getKeys();
  }

  /// 同步获取所有Set集合keys
  static Set<String>? getKeysSync() {
    if (_sharedPreferences != null) {
      return _sharedPreferences?.getKeys();
    }
    throw Exception('需要先执行initSync()同步初始化方法');
  }

  /// 异步存入|修改|删除 key-String 值
  static Future<bool> setString(String key, [String? value]) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (value == null) {
      return sp.remove(key);
    } else {
      return sp.setString(key, value);
    }
  }

  /// 异步获取 String value 值
  static Future<String?> getStringAsync(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  /// 同步获取 String value 值
  static String? getStringSync(String key) {
    if (_sharedPreferences != null) {
      return _sharedPreferences?.getString(key);
    }
    throw Exception('需要先执行initSync()同步初始化方法');
  }

  /// 异步添加|修改|删除 key-List<String>值
  static Future<Future<bool>> setStringList(String key, [List<String>? list]) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (list == null) {
      return sp.remove(key);
    } else {
      return sp.setStringList(key, list);
    }
  }

  /// 异步获取 List<String> list对象
  static Future<List<String>?> getStringListAsync(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getStringList(key);
  }

  /// 同步获取 List<String> list对象
  static List<String>? getStringListSync(String key) {
    if (_sharedPreferences != null) {
      return _sharedPreferences?.getStringList(key);
    }
    throw Exception('需要先执行initSync()同步初始化方法');
  }

  /// 异步数组增加
  static Future<bool> addStringList(String key, List<String> values) async {
    List<String>? list = await getStringListAsync(key);
    if (list == null) {
      return await setStringList(key, values);
    } else {
      list.addAll(values);
      return await setStringList(key, list);
    }
  }

  /// 异步数组单个删除[index|item]
  static Future<bool> removeStringList(String key, {int? index, String? item}) async {
    List<String>? list = await getStringListAsync(key);
    if (list == null) {
      throw Exception('$key 数组不存在！');
    } else {
      if (index != null) {
        list.removeAt(index);
      }
      if (item != null) {
        list.remove(item);
      }
      return await setStringList(key, list);
    }
  }

  /// 异步存入|修改|删除 key-value值
  static Future<bool> setObject(String key, [dynamic? value]) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (value == null) {
      return sp.remove(key);
    } else {
      switch (value.runtimeType) {
        case int:
          return sp.setInt(key, value);
        case double:
          return sp.setDouble(key, value);
        case bool:
          return sp.setBool(key, value);
        case String:
          return sp.setString(key, value);
      }
    }
    throw Exception('${value.runtimeType}类型不支持！');
  }

  /// 异步获取 Object value 值
  static Future<Object?> getObjectAsync(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.get(key);
  }

  /// 同步获取 Object value 值
  static Object? getObjectSync(String key) {
    if (_sharedPreferences != null) {
      return _sharedPreferences?.get(key);
    }
    throw Exception('需要先执行initSync()同步初始化方法');
  }
}
