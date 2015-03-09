Tinytest.add 'package-builder - defined', (test) ->
  isDefined = false
  try
    PackageBuilder
    isDefined = true

  test.isTrue isDefined, "PackageBuilder is not defined"
  test.isTrue Package['peerlibrary:package-builder'].PackageBuilder, "Package.peerlibrary:package-builder.PackageBuilder is not defined"

fs = Npm.require 'fs'
os = Npm.require 'os'
path = Npm.require 'path'

createPackage = ->
  packageDirectory = path.join os.tmpdir(), "meteor-package-#{ Random.id() }"

  fs.mkdirSync packageDirectory

  fs.writeFileSync path.join(packageDirectory, 'package.js'), """
    Package.describe({
      summary: "Foobar package",
      version: '0.1.0',
      name: 'acme:foobar'
    });

    Package.onUse(function (api) {
      api.use(['coffeescript'], ['client', 'server']);
      api.versionsFrom('METEOR@1.0.3.2');

      api.add_files([
        'server.coffee'
      ], 'server');

      api.add_files([
        'client.coffee'
      ], 'client');
    });
  """

  fs.writeFileSync path.join(packageDirectory, 'client.coffee'), """
    client = ->
      console.log "Hello client"
  """

  fs.writeFileSync path.join(packageDirectory, 'server.coffee'), """
    server = ->
      console.log "Hello server"
  """

  packageDirectory

Tinytest.add 'package-builder - building', (test) ->
  packageDirectory = createPackage()

  start = new Date().valueOf()

  pkg = PackageBuilder.buildPackage
    packageDir: packageDirectory
    release: Meteor.release
    # TODO: Verify if setting offline really works (does somehing), and if one can change it between calls
    offline: false

  end = new Date().valueOf()

  console.log "Building package time (offline #{ offline }): #{ (end - start) / 1000 } s"

  test.equal pkg.sourceRoot, packageDirectory
  test.equal pkg.packageName, 'acme:foobar'
  test.equal pkg.version, '0.1.0'

  osFile = fs.readFileSync path.join(pkg.bundleRoot, 'os', 'packages', 'acme:foobar.js'),
    encoding: 'utf8'

  test.include osFile, 'return console.log("Hello server")'

  browserFile = fs.readFileSync path.join(pkg.bundleRoot, 'web.browser', 'packages', 'acme:foobar.js'),
    encoding: 'utf8'

  test.include browserFile, 'return console.log("Hello client")'
