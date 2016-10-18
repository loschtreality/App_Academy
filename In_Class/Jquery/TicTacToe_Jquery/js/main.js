const Game = require('../node_solution/game.js');
const View = require('./ttt-view.js');


$( () => {
  const $ttt = $(".ttt")
  const game = new Game()
  let view = new View(game, $ttt)

  view.setupBoard()
  view.bindEvents()
});
