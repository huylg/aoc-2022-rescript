// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Fs = require("fs");
var Belt_Array = require("rescript/lib/js/belt_Array.js");

var input = Belt_Array.keep(Fs.readFileSync("src/day_5/test", "utf8").split("\n"), (function (e) {
        return e !== "";
      }));

function formatPackage(s) {
  return Belt_Array.map(Belt_Array.map(Belt_Array.map(s, (function (prim) {
                        return prim.trim();
                      })), (function (e) {
                    return Belt_Array.reduce(Belt_Array.keep(e.split(""), (function (e) {
                                      if (e !== "[") {
                                        return e !== "]";
                                      } else {
                                        return false;
                                      }
                                    })), "", (function (acc, e) {
                                  return acc + e;
                                }));
                  })), (function (__x) {
                return __x.split(" ");
              }));
}

var packages = formatPackage(Belt_Array.slice(input, 0, 3));

var columns = Belt_Array.keep(Belt_Array.map(input[3].split(" "), (function (prim) {
            return prim.trim();
          })), (function (e) {
        return e !== "";
      }));

var actions = Belt_Array.map(Belt_Array.sliceToEnd(input, 4), (function (param) {
        return " ".split(param);
      }));

console.log(actions);

exports.input = input;
exports.formatPackage = formatPackage;
exports.packages = packages;
exports.columns = columns;
exports.actions = actions;
/* input Not a pure module */
