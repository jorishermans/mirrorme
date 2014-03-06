part of dart_force_mirrors_lib;

class MetaDataValue<T> {
  
  Symbol memberName;
  InstanceMirror instanceMirror;
  MethodMirror _methodMirror;
  T object;
  
  MetaDataValue(this.object, this._methodMirror, this.memberName, this.instanceMirror);
  
  InstanceMirror invoke(List positionalArguments) {
     return instanceMirror.invoke(memberName, positionalArguments);
  }
  
  List<ParameterMirror> get parameters => this._methodMirror.parameters;

  String toString() => "$object - $memberName";
  
}