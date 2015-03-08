Tinytest.add 'package-builder - defined', (test) ->
  isDefined = false
  try
    PackageBuilder
    isDefined = true

  test.isTrue isDefined, "PackageBuilder is not defined"
  test.isTrue Package['meteor-package-builder'].PackageBuilder, "Package.meteor-package-builder.PackageBuilder is not defined"
