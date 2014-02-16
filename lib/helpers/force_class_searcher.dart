part of dart_force_mirrors_lib;

class ClassSearcher<T> {
  
  List<T> scan() {
    var mirrorSystem = currentMirrorSystem();
    
    List<T> values = new List<T>();
    
    mirrorSystem.libraries.values.forEach((library) {
      var classCounter = 0;
      library.declarations.values.forEach((declaration) {
          if (declaration is ClassMirror) {
            ClassMirror cm = declaration;
            _searchForClassOnMirror(values, cm);
          }
      });
    });
    return values;
  }
  
  void _searchForClassOnMirror(List<T> values, ClassMirror cm) {
    if (cm.hasReflectedType) {
        if (cm.reflectedType == T) {
          InstanceMirror im = cm.newInstance(const Symbol(''), []);
          var obj = im.reflectee;
          values.add(obj);
        } else {
          for (var si in cm.superinterfaces) {
              _searchForClassOnMirror(values, si);
          }
          if (cm.superclass != null) {
            _searchForClassOnMirror(values, cm.superclass);
          }
        }
    }
  }
}