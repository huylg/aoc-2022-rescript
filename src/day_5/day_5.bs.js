// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Fs = require("fs");
var Belt_Array = require("rescript/lib/js/belt_Array.js");
var Belt_MutableStack = require("rescript/lib/js/belt_MutableStack.js");

var input = Belt_Array.keep(Fs.readFileSync("src/day_5/test", "utf8").split("\n"), (function (e) {
        return e !== "";
      }));

function fromArrayToStack(a) {
  return Belt_Array.reduce(a, Belt_MutableStack.make(undefined), (function (stack, cur) {
                Belt_MutableStack.push(stack, cur);
                return stack;
              }));
}

function formatPackage(s) {
  return s;
}

console.log(Belt_Array.map(Belt_Array.slice(input, 0, 3), (function (__x) {
            return __x.split("");
          })));

var stacks;

exports.input = input;
exports.fromArrayToStack = fromArrayToStack;
exports.formatPackage = formatPackage;
exports.stacks = stacks;
/* input Not a pure module */
