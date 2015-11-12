exports.config =
  # See http://brunch.io/#documentation for docs.
  files:
    javascripts:
      joinTo:
        'app.js': /^javascripts\/app/
        'vendor.js': /^javascripts\/vendor/
      order:
        before: [
          'javascripts/vendor/jquery-1.11.0.min.js',
          'javascripts/vendor/jquery.cycle2.js'
        ],
        after: [
          'javascripts/vendor/sc-player.js',
          'javascripts/vendor/soundcloud.player.api.js'
        ]
  paths:
    public: '_site/dist'
    watched: ['javascripts']
  modules:
    wrapper: false
  overrides:
    production:
      paths:
        public: 'dist'
