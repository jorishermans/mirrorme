import 'package:unittest/unittest.dart';
import 'package:forcemirrors/force_mirrors.dart';

main() {  
  // First tests!  
  MetaDataHelper<MetaData> mirrorHelper = new MetaDataHelper<MetaData>();
  List<MetaDataValue<MetaData>> mirrorModels = mirrorHelper.getMirrorValues(new Anno());
  
  test('basic tests for mirror helper api', () {
     expect(mirrorModels.length, 2);
     expect(mirrorModels.first.object.value, "test");
  });
    
}

class Anno {
  
  @MetaData("test")
  void test() {}

  @MetaData("test2")
  void test2() {}
  
}

class MetaData {
  
  final String value;
  const MetaData(this.value);

  String toString() => "$value";
  
}
