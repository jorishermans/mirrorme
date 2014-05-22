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
  
  MetaDataHelper<Var> varMirrorHelper = new MetaDataHelper<Var>();
  List<MetaDataValue<Var>> varMirrorModels = varMirrorHelper.getVariableMirrorValues(new Anno());
    
  test('basic tests for mirror helper api, only on variables', () {
     expect(varMirrorModels.length, 1);
     expect(varMirrorModels.first.name, "bla");
  });
  
  Scanner<Classes, Anno> classesHelper = new Scanner<Classes, Anno>();
  List<Anno> classes = classesHelper.scan();
  
  test('scan classes tests for mirror helper api', () {
    expect(mirrorModels.length, 2);
    expect(mirrorModels.first.object.value, "test");
    expect(classes.length, 1);
    expect(classes.first.value(), 3);
  });
  
  ClassSearcher<Anno> searcher = new ClassSearcher<Anno>();
  List<Anno> searchResult = searcher.scan();
  
  test('Class searcher test of the mirror helper api', () {
    expect(searchResult.length, 2);
    expect(searchResult.first.value(), 5);
  });
  
  AnnotationChecker<Classome> annoChecker = new AnnotationChecker<Classome>();
  
   test('Class searcher test of the mirror helper api', () {
     expect(annoChecker.hasOnClazz(new Anno()), true);
     expect(annoChecker.hasOnClazz(new ExtraAnno()), false);
   });
    
}

@Classes()
@Classome()
class Anno {
  
  @Var()
  String bla;
  
  @MetaData("test")
  void test() {}

  @Var()
  @MetaData("test2")
  void test2() {}
  
  int value() {
    return 3;
  }
}

class ExtraAnno extends Anno {
  int value() {
    return 5;
  }
}

class MetaData {
  
  final String value;
  const MetaData(this.value);

  String toString() => "$value";
  
}

class Classes {
  
  const Classes();
  
}

class Var {
  
  const Var();
  
}

class Classome {
  
  const Classome();
  
}
