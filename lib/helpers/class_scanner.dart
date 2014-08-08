part of dart_force_mirrors_lib;

class Scanner<T, R> {

  List<R> scan() {
    //return new List<R>
    return new List.from(
        //From:
        currentMirrorSystem().isolate.rootLibrary.declarations.values.where(  
            //Where:
            //declarationMirror is ClassMirror
          (dm) => dm is ClassMirror 
            //And declarationMirror.metadata contains any instanceMirror.reflectee with type T
            && dm.metadata.any((im) => im.reflectee is T)
        ).map(// map the result from where to a Reflectee
            (dm) => (dm as ClassMirror).newInstance(const Symbol(''), []).reflectee));
  }
}
