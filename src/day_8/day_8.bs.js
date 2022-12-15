// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Fs = require("fs");
var Belt_Int = require("rescript/lib/js/belt_Int.js");
var Caml_obj = require("rescript/lib/js/caml_obj.js");
var Js_array = require("rescript/lib/js/js_array.js");
var Js_string = require("rescript/lib/js/js_string.js");
var Belt_Array = require("rescript/lib/js/belt_Array.js");
var JsArray2Ex = require("js-array2-ex/src/JsArray2Ex.bs.js");
var Pervasives = require("rescript/lib/js/pervasives.js");
var Belt_Option = require("rescript/lib/js/belt_Option.js");

var input = Fs.readFileSync("src/day_8/input", "utf8").split("\n");

input.pop();

function max_(a, b) {
  if (a === b) {
    return a + 1 | 0;
  } else if (a > b) {
    return a;
  } else {
    return b;
  }
}

function maxUntil(a) {
  return Belt_Array.reduce(a, [], (function (result, cur) {
                var len = result.length;
                var __x = max_(Belt_Option.getWithDefault(Belt_Array.get(result, len - 1 | 0), Pervasives.min_int), cur);
                result.push(__x);
                return result;
              }));
}

var trees = Belt_Array.map(Belt_Array.map(Belt_Array.map(input, (function (param) {
                return Js_string.split("", param);
              })), (function (param) {
            return Js_array.map(Belt_Int.fromString, param);
          })), (function (param) {
        return Js_array.map((function (prim) {
                      return prim;
                    }), param);
      }));

var left = Belt_Array.map(trees, maxUntil);

var right = Belt_Array.map(Belt_Array.map(Belt_Array.map(trees, Belt_Array.reverse), maxUntil), Belt_Array.reverse);

var top = JsArray2Ex.transpose(Belt_Array.map(JsArray2Ex.transpose(trees), maxUntil));

var bottom = JsArray2Ex.transpose(Belt_Array.map(Belt_Array.map(JsArray2Ex.transpose(Belt_Array.map(trees, Belt_Array.reverse)), maxUntil), Belt_Array.reverse));

function min_(a, b) {
  return Belt_Array.zipBy(a, b, Caml_obj.min);
}

function min__(a, b) {
  return Belt_Array.zipBy(a, b, min_);
}

function eqOrGreater_(a, b) {
  return Belt_Array.zipBy(a, b, Caml_obj.greaterequal);
}

console.log(Belt_Array.keep(Belt_Array.flatMap(Belt_Array.zipBy(Belt_Array.zipBy(Belt_Array.zipBy(Belt_Array.zipBy(left, right, min_), top, min_), bottom, min_), trees, (function (a, b) {
                    return eqOrGreater_(b, a);
                  })), (function (a) {
                return a;
              })), (function (a) {
            return a;
          })).length);

exports.input = input;
exports.max_ = max_;
exports.maxUntil = maxUntil;
exports.trees = trees;
exports.left = left;
exports.right = right;
exports.top = top;
exports.bottom = bottom;
exports.min_ = min_;
exports.min__ = min__;
exports.eqOrGreater_ = eqOrGreater_;
/* input Not a pure module */
