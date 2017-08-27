// Note: You must restart bin/webpack-dev-server for changes to take effect

/* eslint global-require: 0 */
/* eslint import/no-dynamic-require: 0 */
const webpack                                        = require('webpack')
const { basename, dirname, join, relative, resolve } = require('path')
const { sync }                                       = require('glob')
const ExtractTextPlugin                              = require('extract-text-webpack-plugin')
const HtmlWebpackPlugin                              = require('html-webpack-plugin')
const ScriptExtHtmlWebpackPlugin                     = require('script-ext-html-webpack-plugin')
const ManifestPlugin                                 = require('webpack-manifest-plugin')
const InterpolateHtmlPlugin                          = require('interpolate-html-plugin')
const HtmlWebpackHarddiskPlugin                      = require('html-webpack-harddisk-plugin')
const extname                                        = require('path-complete-extname')
const { env, settings, output, loadersDir }          = require('./configuration.js')

const extensionGlob = `**/*{${settings.extensions.join(',')}}*`
const entryPath     = join(settings.source_path, settings.source_entry_path)
const packPaths     = sync(join(entryPath, extensionGlob))

module.exports      = {

  entry: {
    polyfills: resolve(`${entryPath}/polyfills`),
    app: [resolve(`${entryPath}/app.ts`), ...sync(resolve(`${entryPath}/app/${extensionGlob}`))]
  },

  output: {
    filename: '[name].js',
    path: output.path,
    publicPath: output.publicPath
  },

  module: {
    rules: sync(join(loadersDir, '*.js')).map(loader => require(loader))
  },

  plugins: [

    new webpack.EnvironmentPlugin(JSON.parse(JSON.stringify(env))),

    new webpack.DefinePlugin({
      HTTP_DOMAIN: settings.domain
    }),

    new InterpolateHtmlPlugin({
      ASSET_URL: env.ASSET_URL
    }),

    new ExtractTextPlugin(env.NODE_ENV === 'production' ? '[name]-[hash].css' : '[name].css'),

    new webpack.optimize.CommonsChunkPlugin({
      name: 'manifest' // Runtime code
    }),

    new webpack.optimize.CommonsChunkPlugin({
      async: true,
      children: true,
      minChunks: 4
    }),

    new ScriptExtHtmlWebpackPlugin({
      sync: ['vendor', 'manifest'],
      async: /\.js$/,
      defaultAttribute: 'async',
      prefetch: {
        test: /\.js$/,
        chunks: 'async'
      }
    }),

    // new HtmlWebpackHarddiskPlugin,
    // new ManifestPlugin({ fileName: paths.manifest, publicPath, writeToFileEmit: true })

    new HtmlWebpackPlugin({
      inject: 'body',
      alwaysWriteToDisk: true,
      template: resolve(settings.source_path, 'index.html')
    }),

    new HtmlWebpackHarddiskPlugin,
    new ManifestPlugin({
      publicPath: output.publicPath,
      writeToFileEmit: true
    })
  ],

  resolve: {
    extensions: settings.extensions,
    modules: [
      'node_modules',
      resolve(settings.source_path)
    ]
  },

  resolveLoader: {
    modules: ['node_modules']
  }
}
