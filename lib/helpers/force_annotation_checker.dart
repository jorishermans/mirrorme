part of dart_force_mirrors_lib;

class AnnotationChecker<T> {
  
   bool hasOnClazz(obj) {   
     return reflect(obj).type.metadata.any((im) => im.reflectee is T);
   }
  
}