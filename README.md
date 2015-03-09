Meteor package builder package 
==============================

Meteor smart package which provider a Meteor package builder. It wraps official Meteor package
toolchain into a package which allows building packages without running external processes.

Adding this package to your [Meteor](http://www.meteor.com/) application adds the `PackageBuilder` object into the global scope.

`PackageBuilder` object has one method, `buildPackage`, which accepts an options object with the following fields:

* `packageDir` – path to the package source directory
* `release` – Meteor release to build the package against (you can use `Meteor.release` to set it to your current Meteor version)
* `offline` – should building operate in offline mode (TODO: Has to be tested)

If everything works well you will get as a result object with many fields containing all possible information about the
package and build system. Probably the most useful fields are:

* `sourceRoot` – path to the package source directory
* `packageName` – name of the built package
* `version` – version fo the built package
* `bundleRoot` – path to the directory with the built package

Server side only.

Installation
------------

```
meteor add peerlibrary:package-builder
```
