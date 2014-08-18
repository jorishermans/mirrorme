part of dart_force_mirrors_lib;

class Scanner<T> {

  /**
   * Scans currentMirrorSystem().isolate.rootLibrary and get the declarations that are
   * [ClassMirror] and contains any annotation [T] and returns a List of reflectees
   * of type [R]
   *
   *     //Get the list of Controllers
   *     List<_Controller> controllers = new Scanner<_Controller, Object>().scan()
   */
  Iterable scan() {

    var scannedObjects = [];

    //For each library in currentSystem().libraries:
    currentMirrorSystem().libraries.values.forEach(
      //Add all reflectees in lm.declaration.values
      (lm) => scannedObjects.addAll(lm.declarations.values
        //Where:
        .where((dm) =>
          //declarationMirror is ClassMirror
          dm is ClassMirror
          //And declarationMirror.metadata contains any instanceMirror.reflectee with type T
          && dm.metadata.any((im) => im.reflectee is T)
        ).map(// map the result from where to a Reflectee
              (dm) => (dm as ClassMirror).newInstance(const Symbol(''), []).reflectee)
    ));

    return scannedObjects;
  }
}
