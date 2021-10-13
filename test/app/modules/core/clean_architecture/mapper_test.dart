import 'package:flutter_test/flutter_test.dart';
import 'package:nuconta_marketplace/app/modules/core/clean_architecture/mapper.dart';

class MockMapper extends Mapper<String> {
  bool isCalledFromMap = false;
  bool isCalledToMap = false;

  @override
  String fromMap(Map map) {
    isCalledFromMap = true;
    return map['item'];
  }

  @override
  Map toMap(String entity) {
    isCalledToMap = true;
    return {'item': entity};
  }
}

void main() {
  late MockMapper mapper;
  final mockList = ['mock1', 'mock2', 'mock3'];
  final mockMapList = [
    {'item': 'mock1'},
    {'item': 'mock2'},
    {'item': 'mock3'}
  ];
  setUp(() {
    mapper = MockMapper();
  });
  test('should call "toMap" on call "toMapList"', () {
    final expectedList = mockMapList;
    expect(mapper.toMapList(mockList), expectedList);
    expect(mapper.isCalledToMap, true);
  });
  test('should call "fromMap" on call "fromMapList"', () {
    final expectedList = mockList;
    expect(mapper.fromMapList(mockMapList), expectedList);
    expect(mapper.isCalledFromMap, true);
  });
  test('should call "toMap" on call "toJson"', () {
    const expected = '{"item":"mock-item"}';
    const mockItem = 'mock-item';
    expect(mapper.toJson(mockItem), expected);
    expect(mapper.isCalledToMap, true);
  });
  test('should call "fromMap" on call "fromJson"', () {
    const expected = 'mock-item';
    const mockItem = '{"item":"mock-item"}';
    expect(mapper.fromJson(mockItem), expected);
    expect(mapper.isCalledFromMap, true);
  });
}
