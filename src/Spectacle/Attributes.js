"use strict";

var createTheme = require("spectacle/lib/themes/default");

exports.createTheme = function (theme) {
  return createTheme.default(theme.colors, theme.fonts);
}