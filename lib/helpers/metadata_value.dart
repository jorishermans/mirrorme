part of dart_force_mirrors_lib;

/**
 * Helper Class that holds the memberName and instanceMirror of the corresponding class.
 * and the value of the corresponding annotation.
 */
class MetaDataValue<T> {
  
  Symbol memberName;
  InstanceMirror instanceMirror;
  DeclarationMirror _dclMirror;
  T object;
  
  MetaDataValue(this.object, this._dclMirror, this.memberName, this.instanceMirror);

  /**
   * invokes the annotated member using the [positionalArguments]
   */
  InstanceMirror invoke(List positionalArguments) {
     return instanceMirror.invoke(memberName, positionalArguments);
  }
 
  /**
   * Get the corresponding name of the annotated [memberName]
   */
  String get name => MirrorSystem.getName(memberName);

  /**
   * Return the list of parameters of the Annotated method
   */
  List<ParameterMirror> get parameters { 
    if (this._dclMirror is MethodMirror) {
      MethodMirror mm = this._dclMirror;
      return mm.parameters;
    }
    return new List<ParameterMirror>();
  }

  /**
   * Get other metadata of the annotated Declaration
   */
  List<Object> getOtherMetadata() {
    List<Object> objects = new List<Object>();
    for (InstanceMirror im in _dclMirror.metadata) {
      if (!(im.type is T) && im.hasReflectee) {
        objects.add(im.reflectee);
      }
    }
    return objects;
  }
  
  /**
   * Get the return type of the variable or the method that metadata is on
   */
  Type typeOfOwner() {
    if (this._dclMirror is MethodMirror) {
      MethodMirror mm = this._dclMirror;
      return mm.returnType.reflectedType;
    }
    if (this._dclMirror is MethodMirror) {
      VariableMirror vm = this._dclMirror;
      return vm.type.reflectedType;
    }
    return null;
  }
  
  String toString() => "$object - $memberName";
  
}