class View {
  constructor(game, $jobj) {
    this.$board = $jobj;
    this.game = game;
  }

  bindEvents() {
    let that = this;
  $('.square').on("click", function () {
    if ($(this).hasClass("clicked")) {
      alert("You can't place a mark there!")
    }
    else {
      that.makeMove($(this));
    }
    if (that.game.board.isOver()) {
      that.showWinner(that.game.winner())
    }

  })

  }

  showWinner(winningMark) {
    $('.group').children().each(function(i, el) {
      if ($(el).data("mark") === winningMark) {
        $(el).addClass("winner");
      } else {
        $(el).addClass("loser")
      }
    })
    let cap = `<figcaption>You win, ${winningMark}</figcaption>`
    $('.ttt').append(cap)
  }



  makeMove($square) {
    $($square).text(this.game.currentPlayer);
    $($square).data("mark", this.game.currentPlayer);
    this.game.playMove($($square).data("pos"));
    $($square).addClass('clicked');
  }

  setupBoard() {
    let $ul = $('<ul></ul>').addClass('group');
    this.game.board.grid.forEach( function (row, i) {
      row.forEach(function (col, j) {
        let sq = $('<li></li>').addClass("square").data('pos', [i, j])
        $ul.append(sq);
      })
    })
    this.$board.append($ul)
  }


} // end

module.exports = View;
