part of dart_force_mirrors_lib;

/**
 * Helper class to create [MetadataValue]<[T]> from the Declarations (Variables and Methods)
 * in the passed obj.
 */
class MetaDataHelper<T, DM> {
  /**
   * Get the Iterable of [DeclarationMirror] that are annotated with [T]
   */
  Iterable<DeclarationMirror> _scan(InstanceMirror im) {
      return im.type.declarations.values
            .where((DeclarationMirror dm) => 
                dm is DM
                && dm.metadata.any((am) => am.reflectee is T));
  }

  /**
   * Get MetaDataValue of the obj's properties annotated with T (ej. @Value or @Autowired)
   */
  List<MetaDataValue<T>> from(Object obj) {
    var instanceMirror = reflect(obj);
    return new List.from(_scan(instanceMirror).map((dm) {
      InstanceMirror am1 = dm.metadata.firstWhere((am) => am.reflectee is T);
      return new MetaDataValue<T>(am1.reflectee, dm, dm.simpleName, instanceMirror);
    }));
  }
}