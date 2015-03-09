Package.describe({
  summary: "Meteor package builder package",
  version: '0.1.0',
  name: 'peerlibrary:package-builder',
  git: 'https://github.com/peerlibrary/meteor-package-builder.git'
});

Npm.depends({
  'meteor-package-builder': 'https://github.com/peerlibrary/node-meteor-package-builder/tarball/bdbb827e7ddc61f4656493a9a60b59d40b33335c'
});

Package.onUse(function (api) {
  api.use(['package-version-parser'], 'server');
  api.versionsFrom('METEOR@1.0.3.2');

  api.export('PackageBuilder');

  api.add_files([
    'server.js'
  ], 'server');
});

Package.onTest(function (api) {
  api.use(['peerlibrary:package-builder', 'tinytest', 'test-helpers', 'coffeescript', 'random'], 'server');

  api.add_files([
    'tests.coffee'
  ], 'server');
});
