### Mirror me ###

A mirrors helper library for the dart language.

#### Walkthrough ####

This is how you can scrap the metadata info from an object. 

	MetaDataHelper<MetaData, MethodMirror> mirrorHelper = new MetaDataHelper<MetaData, MethodMirror>();
  	List<MetaDataValue<MetaData>> mirrorModels = mirrorHelper.from(new Anno());
  	
The annotated class.

	class Anno {
  
	  @MetaData("test")
	  void test() {}
	  
	}

MetaDataValue has the following fields:

	Symbol memberName;
  	InstanceMirror instanceMirror;
  	T object;

Search for classes that implement or extend for example the class Anno.

	ClassSearcher<Anno> searcher = new ClassSearcher<Anno>();
  	List<Anno> searchResult = searcher.scan();

### Notes to Contributors ###

#### Fork Mirrorme ####

If you'd like to contribute back to the core, you can [fork this repository](https://help.github.com/articles/fork-a-repo) and send us a pull request, when it is ready.

If you are new to Git or GitHub, please read [this guide](https://help.github.com/) first.

#### For usage see Dart Force ####

Realtime web framework for dart that uses forcemvc & mirrorme & wired [source code](https://github.com/ForceUniverse/dart-force)