part of dart_force_mirrors_lib;

class AnnotationScanner<T> {
  /**
   * Check if the Annotation [T] is on the annotated object [obj]
   */
   bool isOn(obj) {   
     return reflect(obj).type.metadata.any((im) => im.reflectee is T);
   }
   
   /**
    * Get the Instance of the Annotation [T] from the annotated object [obj]
    */
   T instanceFrom(obj) {
     if(isOn(obj))
       return (reflect(obj).type.metadata
           .singleWhere((im) => im.reflectee is T)
           .reflectee as T);
     return null;
   }
  
}