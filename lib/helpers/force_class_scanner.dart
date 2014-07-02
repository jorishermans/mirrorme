part of dart_force_mirrors_lib;

class Scanner<T,R> {
  
  List<R> scan() {
    var mirrorSystem = currentMirrorSystem();
    
    List<R> values = new List<R>();
    
    mirrorSystem.libraries.values.forEach((library) {
      String name = MirrorSystem.getName(library.simpleName);
      if (!name.startsWith("dart.")) {
        library.declarations.values.forEach((declaration) {
          if (declaration is ClassMirror) {
            ClassMirror cm = declaration;
            for (var im in cm.metadata) {
              if (im.reflectee is T) {
                if (cm.hasReflectedType) {
                  InstanceMirror im = cm.newInstance(const Symbol(''), []);
                  var obj = im.reflectee;
                  values.add(obj);
                }
              }
            }
          }
        });
      }
    });
    return values;
  }
}