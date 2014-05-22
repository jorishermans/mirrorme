part of dart_force_mirrors_lib;

class MetaDataValue<T> {
  
  Symbol memberName;
  InstanceMirror instanceMirror;
  DeclarationMirror _dclMirror;
  T object;
  
  MetaDataValue(this.object, this._dclMirror, this.memberName, this.instanceMirror);
  
  InstanceMirror invoke(List positionalArguments) {
     return instanceMirror.invoke(memberName, positionalArguments);
  }
  
  String get name => MirrorSystem.getName(memberName);
  
  List<ParameterMirror> get parameters { 
    if (this._dclMirror is MethodMirror) {
      MethodMirror mm = this._dclMirror;
      return mm.parameters;
    }
    return new List<ParameterMirror>();
  }

  String toString() => "$object - $memberName";
  
}