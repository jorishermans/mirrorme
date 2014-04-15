part of dart_force_mirrors_lib;

class AnnotationChecker<T> {
  
   bool hasOnClazz(obj) {   
     InstanceMirror instanceMirror = reflect(obj);
     ClassMirror MyClassMirror = instanceMirror.type;
     for(InstanceMirror im in MyClassMirror.metadata) {
        if (im.reflectee is T) {
           return true;
        }
     }
     return false;
   }
  
}