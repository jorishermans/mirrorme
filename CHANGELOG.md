### Changelog ###

This file contains highlights of what changes on each version of the forcemvc package. 

#### Pub version 0.2.1+1 - 0.2.1+5 ####

add a method on MetadataValue to get the return type typeOfOwner

#### Pub version 0.2.1 ####

extends the MetaDataHelper with method fromMirror, so we can look at it without instantiating it.

#### Pub version 0.2.0 ####

add iml to gitignore
Rename AnnotationChecker to AnnotationScanner
Scan All libraries instead of just RootLibrary
Add Documentation

#### Pub version 0.1.11 ####

Change logic of annotation_checker and class_scanner to reduce size.

#### Pub version 0.1.10+3 ####

Skip dart core libraries to scan for annotations.

#### Pub version 0.1.10 & 0.1.10+1 & 0.1.10+2 ####

Add method 'getOtherMetadata' in the class 'MetaDataValue'.

#### Pub version 0.1.9 ####

Extend MetaDataHelper so it can search for methods and variables.

#### Pub version 0.1.8 ####

Adding name to get the string name out of the mirrors in the class 'MetaDataValue'.

#### Pub version 0.1.8 ####

Adding functionality to check if a annotation is available on a class.

#### Pub version 0.1.7 ####

Provide methodMirror in MetaDataValue and added a property to access parameters.

#### Pub version 0.1.6+2 ####

Adding dev dependencies for unittests.

#### Pub version 0.1.6+1 ####

Creating the correct instance of the correct class in class searcher.

#### Pub version 0.1.6 ####

Adding a way to search for class that implements or extends a certain class with mirror operations.

#### Pub version 0.1.5 ####

Solving a bug in metadata helpers to return a value.

#### Pub version 0.1.5 ####

Adding a class scanner to get a list of all classes with a certain annotation.

#### Pub version 0.1.4 & 0.1.4+1 ####

Adding invoke method to force metadata value.

#### Pub version 0.1.3 & 0.1.3+1 ####

Adding some minor changes.

#### Pub version 0.1.2+1 ####

Adding tests for mirrorhelpers and classes for annotation handling.


