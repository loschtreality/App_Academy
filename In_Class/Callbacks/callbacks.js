class Clock {
  constructor() {
    // 1. Create a Date object.
    let date = new Date;
    // 2. Store the hours, minutes, and seconds.
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    // 3. Call printTime.
    this.printTime()
    setInterval(()=>(this._tick()), 1000)
  }

  printTime() {

    let times = [this.hours, this.minutes, this.seconds].map(function (time) {
      let stringified = time.toString()
      if (stringified.length === 1) {
        return "0" + stringified
      }
      else {
        return stringified
      }
    });

    console.log(`${times[0]}:${times[1]}:${times[2]}`);
  }

  _tick() {
    this.seconds += 1
    if (this.seconds >= 60 ) {
      this.seconds %= 60;
      this.minutes += 1;
     }
    if (this.minutes >= 60) {
      this.minutes %= 60;
      this.hours += 1;
    }
    if (this.hours >= 24) {
      this.hours %= 24
    }

    this.printTime()
  }

}

const clock = new Clock();
