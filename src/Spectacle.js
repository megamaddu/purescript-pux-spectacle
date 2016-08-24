"use strict";

var React = require("react");
var createElement = React.createElement;
var Pux = require("purescript-pux");
var Spectacle = require("spectacle");
var preloader = require("spectacle/lib/utils/preloader").default;

var hasPreloaded = false
exports.spectacle = Pux.fromReact(function(props) {
  if (!hasPreloaded && props.preload) {
    hasPreloaded = true
      // This is a little sketchy since we're hiding
      // side effects, but it cleans up the API quite
      // a bit.  These side effects also only affect the
      // browser cache and not the app state, and we're
      // doing it down in the React layer where
      // everything's secretly effectful anyway.. ;)
      // If you want to represent it more purely you
      // can use the FFI to import `preloader` and Eff
      // to run it explicitly as Pux is initializing
      // the application.
      preloader(props.preload);
    }
    return createElement(
      Spectacle.Spectacle,
      {
        history: props.history,
        theme: props.theme
      },
      props.children[0]
    );
});

exports.deck = Pux.fromReact(Spectacle.Deck);

exports.slide = Pux.fromReact(Spectacle.Slide);

exports.appear = Pux.fromReact(function(props) {
  return createElement(
    Spectacle.Appear,
    props,
    props.children[0]
  );
});

exports.blockQuote = Pux.fromReact(Spectacle.BlockQuote);

exports.quote = Pux.fromReact(Spectacle.Quote);

exports.cite = Pux.fromReact(Spectacle.Cite);

exports.codePane = Pux.fromReact(Spectacle.CodePane);

exports.deck = Pux.fromReact(Spectacle.Deck);

exports.fill = Pux.fromReact(Spectacle.Fill);

exports.heading = Pux.fromReact(Spectacle.Heading);

exports.image = Pux.fromReact(Spectacle.Image);

exports.layout = Pux.fromReact(Spectacle.Layout);

exports.link = Pux.fromReact(Spectacle.Link);

exports.listItem = Pux.fromReact(Spectacle.ListItem);

exports.list = Pux.fromReact(Spectacle.List);

exports.markdown = Pux.fromReact(Spectacle.Markdown);

exports.slide = Pux.fromReact(Spectacle.Slide);

exports.textS = Pux.fromReact(Spectacle.Text);
