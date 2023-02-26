const express = require("express");
const app = express();

const path = require("path");

app.use(express.json());

const dummy = [
  {
    id: 0,
    todo: "TODO1",
    check: false
  },
  {
    id: 1,
    todo: "TODO2",
    check: false
  }
];

app.get("/", function(req, res) {
  // res.send("Hello World");

  var data = [
    {
      title: "edm",
      titleSrc: "https://t1.daumcdn.net/cfile/tistory/24283C3858F778CA2E",
      des: [
        {
          title: "0",
          des: "0",
          src: ""
        }
      ]
    },
    {
      title: "edm2",
      titleSrc:
        "https://cdn.pixabay.com/photo/2017/09/25/13/12/puppy-2785074__480.jpg",
      des: [
        {
          title: "0",
          des: "0",
          src: ""
        }
      ]
    }
  ];
  res.status(200).json(data);
});

app.get("/todo", (req, res) => {
  res.json(dummy);
});

app.post("/todo/add", (req, res) => {
  console.log(req.headers);
  console.log(req.body.todo);
  const { todo } = req.body;
  const _data = {
    id: dummy.length,
    todo,
    check: false
  };

  dummy.push(_data);
  res.json(_data);
});

// 웹에서 들어온 정보의 OS를 찾아본다.
app.get("/deep", (req, res) => {
  if (req.headers["user-agent"].indexOf("Android") > 0) {
    return res.sendFile(path.join(__dirname, "./dep.html"));
  }
  if (req.headers["user-agent"].indexOf("iPhone") > 0) {
    return res.sendFile(path.join(__dirname, "./dev2.html"));
  }
  return res.send("모바일로 접속해주세요");
});

app.listen(3000);

// 172.30.1.28
