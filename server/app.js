const express = require("express");
const app = express();

app.get("/", function(req, res) {
  // res.send("Hello World");

  var data = [
    {
      title: "edm",
      titleSrc:
        "https://ssl.pstatic.net/melona/libs/1432/1432722/103266b5bfd9770b419c_20230120150040883.jpg",
      des: [
        {
          title: "0",
          des: "0",
          src: "",
        },
      ],
    },
  ];
  res.status(200).json(data);
});

app.listen(3000);

// 172.30.1.28
