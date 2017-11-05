export default function () {
  if (document.body.dataset.action === 'show') {
    Array.prototype.forEach.call(document.getElementsByClassName('js-wrap-sticker-pasting-column'), (container) => {
      const stickerBoard = new StickerBoard(container);
      stickerBoard.start();
    });
  }
}

// TODO: リサイズで表示位置を直す
// TODO: クリックでステッカー追加
// TODO: リアルタイム更新
class StickerBoard {
  constructor(container) {
    this.container = container;
    this.canvas = container.getElementsByTagName('canvas')[0];
    this.board = new Board(JSON.parse(this.canvas.dataset.board), this.canvasWidth(), this.canvasHeight());
  }

  start() {
    const updateCanvas = this.render.bind(this);
    window.addEventListener('resize', updateCanvas);
    document.removeEventListener('turbolinks:before-visit', () => {
      window.removeEventListener('resize', updateCanvas);
    });

    this.render();
  }

  render() {
    const {container, canvas, board} = this;

    canvas.height = this.canvasHeight();
    canvas.width = this.canvasWidth();

    let ctx = canvas.getContext('2d');
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    board.render(ctx);
  }

  canvasWidth() {
    return this.container.offsetWidth;
  }

  canvasHeight() {
    return this.container.offsetHeight;
  }
}

class Board {
  constructor(data, width, height) {
    this.id = data.id;
    this.title = data.title;
    this.width = width;
    this.height = height;
    this.items = data.items.map((item, i) => {
      let itemWidth = width / data.items.length;
      let itemHeight = height;
      let offsetX = itemWidth * i;
      let offsetY = 40;
      return new Item(item, offsetX, offsetY, itemWidth, itemHeight);
    });
  }

  render(ctx) {
    ctx.textBaseline = "top";
    ctx.textAlign = "left";
    ctx.font = "20px 'Roboto','sans-serif'";
    ctx.strokeStyle = 'rgb(0, 0, 0)';
    ctx.fillStyle = 'rgb(0, 0, 0)';
    ctx.fillText(this.title, 0, 10);

    ctx.beginPath();
    ctx.moveTo(0, 40);
    ctx.lineTo(this.width, 40);
    ctx.closePath();
    ctx.stroke();

    this.items.forEach((item) => {
      item.render(ctx);
    });
  }
}

class Item {
  constructor(data, offsetX, offsetY, width, height) {
    this.id = data.id;
    this.title = data.title;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.width = width;
    this.height = height;

    this.stickers = data.stickers.map((sticker) => {
      return new Sticker(sticker, offsetX, offsetY + 40, this.width, this.height);
    });
  }

  render(ctx) {
    ctx.font = "16px 'Roboto','sans-serif'";
    ctx.strokeStyle = 'rgb(0, 0, 0)';
    ctx.fillStyle = 'rgb(0, 0, 0)';
    ctx.fillText(this.title, this.coordinateX(0), this.coordinateY(10));

    ctx.beginPath();
    ctx.moveTo(this.coordinateX(0), this.coordinateY(0));
    ctx.lineTo(this.coordinateX(0), this.coordinateY(this.height));
    ctx.closePath();
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(this.coordinateX(0), this.coordinateY(30));
    ctx.lineTo(this.coordinateX(this.width), this.coordinateY(30));
    ctx.closePath();
    ctx.stroke();

    this.stickers.forEach((sticker) => {
      sticker.render(ctx, this);
    });
  }

  coordinateX(x) {
    return this.offsetX + x;
  }

  coordinateY(y) {
    return this.offsetY + y;
  }
}

class Sticker {
  constructor(data, offsetX, offsetY, width, height) {
    this.id = data.id;
    this.x = data.x;
    this.y = data.y;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.width = width;
    this.height = height;
  }

  render(ctx) {
    let px = this.coordinateX(this.x);
    let py = this.coordinateY(this.y);
    if (px > this.coordinateX(0) && px < this.coordinateX(this.width) &&
      py > this.coordinateY(0) && py < this.coordinateY(this.width)) {

      ctx.fillStyle = 'rgb(192, 80, 77)';
      ctx.beginPath();
      ctx.arc(px, py, 10, 0, Math.PI*2, false);
      ctx.fill();
    }
  }

  coordinateX(x) {
    return this.offsetX + x;
  }

  coordinateY(y) {
    return this.offsetY + y;
  }
}
