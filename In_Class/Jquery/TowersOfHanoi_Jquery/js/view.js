class View {
  constructor(game, $jobj) {
    this.game = game;
    this.$towers = $jobj;
    this.clicked = false;
  }

  setupTowers() {
    const order = ["One", "Two", "Three"];
    for (var i = 0; i < 3; i++) {
      let tower = $(`<ul id=tower${order[i]} class="tower"></ul>`).data("pos", i)
      $('.hanoi').append(tower);
    }
    for (var j = 0; j < 3; j++) {
      $(`#tower${order[0]}`).append($(`<li class="disk${order[j]}"></li>`));
    }
  }

  render () {
    let that = this
    $('.tower').on("click", function () {
      if (that.clicked) {
        if (that.game.isValidMove(that.clicked, $(this).data('pos'))) {
          that.game.move(that.clicked, $(this).data('pos'))
          $("[class*='selected']").removeClass('selected')
          that.clicked = false
        } else {
          $("[class*='selected']").removeClass('selected')
          that.clicked = false
          alert("Invalid move!")
         }
      } else {
        $(this).addClass('selected')
        that.clicked = $(this).data('pos');
      }
    })
  }

  clickTower() {

  }


} // end

module.exports = View;
