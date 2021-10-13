import 'dart:convert';

abstract class Mapper<T extends Object> {
  const Mapper();
  Map toMap(T entity);
  T fromMap(Map map);

  List<T> fromMapList(List list) => list.map((map) => fromMap(map)).toList();
  List<Map> toMapList(List<T> entity) => entity.map(toMap).toList();
  String toJson(T entity) => json.encode(toMap(entity));
  T fromJson(String source) => fromMap(json.decode(source));
}
