const a = _ => console.log("A");

var bb = 0;

new Promise((resolve, reject) => {
  console.log("B");
  setTimeout(() => {
    bb = 1;
  }, 1000)
    .then(() => {
      bb = 1;
    })
    .then(() => console.log(bb));
});

a();
console.log(bb);
