# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( prefixfree.min.js )
Rails.application.config.assets.precompile += %w( prefixfree.js )
Rails.application.config.assets.precompile += %w( html5shiv.js )
Rails.application.config.assets.precompile += %w( respond.min.js )
Rails.application.config.assets.precompile += %w( respond.js )
Rails.application.config.assets.precompile += %w( ar.css )
Rails.application.config.assets.paths << "#{Rails.root}/app/assets/fonts"
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/