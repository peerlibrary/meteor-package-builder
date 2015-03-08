Tinytest.add 'package-builder - defined', (test) ->
  isDefined = false
  try
    PackageBuilder
    isDefined = true

  test.isTrue isDefined, "PackageBuilder is not defined"
  test.isTrue Package['peerlibrary:package-builder'].PackageBuilder, "Package.peerlibrary:package-builder.PackageBuilder is not defined"
