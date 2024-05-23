const { environment } = require('@rails/webpacker')
const { WebpackManifestPlugin } = require('webpack-manifest-plugin')


const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)
environment.plugins.append('Manifest', new WebpackManifestPlugin({
  fileName: 'manifest.json',
  publicPath: '/packs/',
  writeToFileEmit: true,
}));

module.exports = environment