// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Fs = require("fs");
var Belt_Int = require("rescript/lib/js/belt_Int.js");
var Js_string = require("rescript/lib/js/js_string.js");
var Belt_Array = require("rescript/lib/js/belt_Array.js");
var Belt_SortArray = require("rescript/lib/js/belt_SortArray.js");

console.log(Belt_Array.reduce(Belt_Array.slice(Belt_SortArray.stableSortBy(Belt_Array.reduce(Js_string.split("\n", Fs.readFileSync("./src/day_1/test.txt", "utf8")), [0], (function (acc, cur) {
                        if (cur === "") {
                          return Belt_Array.concat(acc, [0]);
                        }
                        var last = acc.length - 1 | 0;
                        var calo = acc[last] + Belt_Int.fromString(cur) | 0;
                        acc[last] = calo;
                        return acc;
                      })), (function (a, b) {
                    return b - a | 0;
                  })), 0, 3), 0, (function (acc, cur) {
            return acc + cur | 0;
          })));

/*  Not a pure module */
