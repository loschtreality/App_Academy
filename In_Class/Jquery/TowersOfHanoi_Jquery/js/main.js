const Game = require('../node_solution/game.js');
const View = require('./view.js');

$( () => {
  const rootEl = $('.hanoi');
  const game = new Game();
  const view = new View(game, rootEl);
  view.setupTowers();
  view.render();
});
