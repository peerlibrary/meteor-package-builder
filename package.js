Package.describe({
  summary: "Meteor package builder package",
  version: '0.1.0',
  name: 'peerlibrary:package-builder',
  git: 'https://github.com/peerlibrary/meteor-package-builder.git'
});

Npm.depends({
  'meteor-package-builder': 'https://github.com/peerlibrary/node-meteor-package-builder/tarball/6f566c846e9451d09d072520f31eb74bcc37fe99'
});

Package.onUse(function (api) {
  api.versionsFrom('METEOR@1.0.3.2');

  api.export('PackageBuilder');

  api.add_files([
    'server.js'
  ], 'server');
});

Package.onTest(function (api) {
  api.use(['peerlibrary:package-builder', 'tinytest', 'test-helpers', 'coffeescript'], 'server');

  api.add_files([
    'tests.coffee'
  ], 'server');
});
