const path = require("path");
const fs = require("fs");
const compiler = require("@riotjs/compiler");
const sass = require("node-sass");
const MomentLocalesPlugin = require("moment-locales-webpack-plugin");

compiler.registerPreprocessor("css", "sass", function(code, { options }) {
  const { file } = options;

  console.log("Compile the sass code in", file);

  const theme = fs.readFileSync("./style/theme.scss");
  const { css } = sass.renderSync({
    data: theme + code
  });

  return {
    code: css.toString(),
    map: null
  };
});

module.exports = {
  entry: ["./app/main.js"],
  output: {
    path: path.resolve(__dirname, "public"),
    publicPath: "/public/",
    filename: "bundle.js"
  },
  devtool: "inline",
  plugins: [new MomentLocalesPlugin()],
  module: {
    rules: [
      {
        test: /\.riot$/,
        exclude: /node_modules/,
        use: {
          loader: "@riotjs/webpack-loader",
          options: {
            hot: false
          }
        }
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"]
          }
        }
      }
    ]
  }
};
