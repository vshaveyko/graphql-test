// Note: You must restart bin/webpack-dev-server for changes to take effect

const merge = require('webpack-merge')
const sharedConfig = require('./shared.js')
const { settings, output } = require('./configuration.js')

module.exports = merge(sharedConfig, {
  devtool: 'eval-source-map',

  stats: {
    errorDetails: true
  },

  output: {
    pathinfo: true
  },


  devServer: {
    proxy: [
      {
        context: ['/api/**', '/uploads/**'],
        target: 'http://localhost:3000',
        secure: false
      },

      // "/websocket": {
      //   target: "http://localhost:3000",
      //   ws: true
      // }
    ],
    clientLogLevel: 'none',
    https: settings.dev_server.https,
    host: settings.dev_server.host,
    port: settings.dev_server.port,
    contentBase: output.path,
    publicPath: output.publicPath,
    compress: false,
    headers: { 'Access-Control-Allow-Origin': '*' },
    historyApiFallback: true,
    watchOptions: {
      ignored: /node_modules/
    }
  }
})
