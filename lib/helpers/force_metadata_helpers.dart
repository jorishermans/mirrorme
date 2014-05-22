part of dart_force_mirrors_lib;

class MetaDataHelper<T> {
  
  static const String method = "method";
  static const String variables = "variables";
  
  List<MetaDataValue<T>> getMirrorValues(Object obj) {
   return _mirrorValues(obj, method); 
  }
  
  List<MetaDataValue<T>> getVariableMirrorValues(Object obj) {
     return _mirrorValues(obj, variables); 
  }
  
  List<MetaDataValue<T>> _mirrorValues(Object obj, String type) {
    InstanceMirror instanceMirror = reflect(obj);
    ClassMirror MyClassMirror = instanceMirror.type;
   
    Iterable<DeclarationMirror> decls =
        MyClassMirror.declarations.values;
    
    List<MetaDataValue> mirrorValues = new List<MetaDataValue>();
    
    for (DeclarationMirror dclMirror in decls) {
      if (dclMirror is MethodMirror && type == method) {
        _addMirror(mirrorValues, instanceMirror, dclMirror);
      } else if (dclMirror is VariableMirror && type == variables) {
        _addMirror(mirrorValues, instanceMirror, dclMirror);
      }
    }
    return mirrorValues;
  }
  
  void _addMirror(List<MetaDataValue> mirrorValues, InstanceMirror instanceMirror, DeclarationMirror dclMirror) {
    if (dclMirror.metadata.isNotEmpty) {
           // var request = mm.metadata.first.reflectee;
           for (var im in dclMirror.metadata) {
               if (im.reflectee is T) {
                   var request = im.reflectee;
                   Symbol memberName = dclMirror.simpleName;
                          
                   mirrorValues.add(new MetaDataValue<T>(request, dclMirror, memberName, instanceMirror));
                }
            }
     }
  }
  
}