module.exports = {
  entry: "./app.jsx",
  output: {
      path: "./frontEnd",
      filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /(node_modules)/,
        loader: 'babel',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    root: __dirname,
    extensions: ['', '.js', '.jsx']
  }
};
