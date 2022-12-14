// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Fs = require("fs");
var Belt_Array = require("rescript/lib/js/belt_Array.js");
var Caml_int32 = require("rescript/lib/js/caml_int32.js");
var Belt_SetInt = require("rescript/lib/js/belt_SetInt.js");
var Belt_MapString = require("rescript/lib/js/belt_MapString.js");

var dictionary = Belt_MapString.fromArray([
      [
        "a",
        1
      ],
      [
        "b",
        2
      ],
      [
        "c",
        3
      ],
      [
        "d",
        4
      ],
      [
        "e",
        5
      ],
      [
        "f",
        6
      ],
      [
        "g",
        7
      ],
      [
        "h",
        8
      ],
      [
        "i",
        9
      ],
      [
        "j",
        10
      ],
      [
        "k",
        11
      ],
      [
        "l",
        12
      ],
      [
        "m",
        13
      ],
      [
        "n",
        14
      ],
      [
        "o",
        15
      ],
      [
        "p",
        16
      ],
      [
        "q",
        17
      ],
      [
        "r",
        18
      ],
      [
        "s",
        19
      ],
      [
        "t",
        20
      ],
      [
        "u",
        21
      ],
      [
        "v",
        22
      ],
      [
        "w",
        23
      ],
      [
        "x",
        24
      ],
      [
        "y",
        25
      ],
      [
        "z",
        26
      ],
      [
        "A",
        27
      ],
      [
        "B",
        28
      ],
      [
        "C",
        29
      ],
      [
        "D",
        30
      ],
      [
        "E",
        31
      ],
      [
        "F",
        32
      ],
      [
        "G",
        33
      ],
      [
        "H",
        34
      ],
      [
        "I",
        35
      ],
      [
        "J",
        36
      ],
      [
        "K",
        37
      ],
      [
        "L",
        38
      ],
      [
        "M",
        39
      ],
      [
        "N",
        40
      ],
      [
        "O",
        41
      ],
      [
        "P",
        42
      ],
      [
        "Q",
        43
      ],
      [
        "R",
        44
      ],
      [
        "S",
        45
      ],
      [
        "T",
        46
      ],
      [
        "U",
        47
      ],
      [
        "V",
        48
      ],
      [
        "W",
        49
      ],
      [
        "X",
        50
      ],
      [
        "Y",
        51
      ],
      [
        "Z",
        52
      ]
    ]);

function stringToMapInt(e) {
  return Belt_SetInt.fromArray(Belt_Array.map(e.split(""), (function (param) {
                    return Belt_MapString.getExn(dictionary, param);
                  })));
}

function chunk(a, l) {
  return Belt_Array.makeBy(Caml_int32.div(a.length, l), (function (i) {
                return [
                        a[Math.imul(i, l)],
                        a[Math.imul(i, l) + 1 | 0],
                        a[Math.imul(i, l) + 2 | 0]
                      ];
              }));
}

function sum(a, b) {
  return a + b | 0;
}

console.log(Belt_Array.reduce(Belt_Array.map(Belt_Array.map(Belt_Array.map(chunk(Belt_Array.keep(Fs.readFileSync("./src/day_3/test_final.txt", "utf8").split("\n"), (function (e) {
                                return e !== "";
                              })), 3), (function (param) {
                        var m_a = stringToMapInt(param[0]);
                        var m_b = stringToMapInt(param[1]);
                        var m_c = stringToMapInt(param[2]);
                        return Belt_SetInt.intersect(Belt_SetInt.intersect(m_a, m_b), m_c);
                      })), Belt_SetInt.toArray), (function (__x) {
                return __x[0];
              })), 0, sum));

var input;

exports.dictionary = dictionary;
exports.stringToMapInt = stringToMapInt;
exports.chunk = chunk;
exports.sum = sum;
exports.input = input;
/* dictionary Not a pure module */
