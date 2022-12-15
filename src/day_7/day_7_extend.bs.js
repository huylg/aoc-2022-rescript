// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Fs = require("fs");
var Belt_Int = require("rescript/lib/js/belt_Int.js");
var Caml_obj = require("rescript/lib/js/caml_obj.js");
var Belt_Array = require("rescript/lib/js/belt_Array.js");

var root = {};

Caml_obj.update_dummy(root, {
      path: "/",
      dirs: [],
      files: [],
      parent: root
    });

var input = Fs.readFileSync("src/day_7/input", "utf8").split("\n");

var length = input.length;

Belt_Array.reduce(Belt_Array.slice(input, 1, length - 2 | 0), root, (function (pwd, line) {
        var commandLine = line.split(" ");
        var len = commandLine.length;
        if (len !== 2) {
          if (len !== 3) {
            return pwd;
          }
          var match = commandLine[0];
          if (match !== "$") {
            return pwd;
          }
          var match$1 = commandLine[1];
          if (match$1 !== "cd") {
            return pwd;
          }
          var path = commandLine[2];
          switch (path) {
            case ".." :
                return pwd.parent;
            case "/" :
                return root;
            default:
              return Belt_Array.getBy(pwd.dirs, (function (d) {
                            return d.path === path;
                          }));
          }
        } else {
          var size = commandLine[0];
          switch (size) {
            case "$" :
                var match$2 = commandLine[1];
                if (match$2 === "ls") {
                  return pwd;
                }
                break;
            case "dir" :
                var path$1 = commandLine[1];
                var newDir_dirs = [];
                var newDir_files = [];
                var newDir = {
                  path: path$1,
                  dirs: newDir_dirs,
                  files: newDir_files,
                  parent: pwd
                };
                pwd.dirs.push(newDir);
                return pwd;
            default:
              
          }
          var path$2 = commandLine[1];
          var newFile_size = Belt_Int.fromString(size);
          var newFile = {
            path: path$2,
            size: newFile_size
          };
          pwd.files.push(newFile);
          return pwd;
        }
      }));

function dirSize(root) {
  var filesSize = Belt_Array.reduce(root.files, 0, (function (acc, cur) {
          return cur.size + acc | 0;
        }));
  var dirsSize = Belt_Array.reduce(root.dirs, 0, (function (acc, cur) {
          return acc + dirSize(cur) | 0;
        }));
  return filesSize + dirsSize | 0;
}

var rootSize = dirSize(root);

var requiredSize = (rootSize + 30000000 | 0) - 70000000 | 0;

console.log(requiredSize);

function findDir(root) {
  return Belt_Array.concat(Belt_Array.flatMap(root.dirs, findDir), root.dirs);
}

function ppDir(root, level) {
  console.log(Belt_Array.joinWith(Belt_Array.make(level, " "), "", (function (prim) {
              return String(prim);
            })), "dir", root.path, dirSize(root));
  Belt_Array.forEach(root.files, (function (f) {
          console.log(Belt_Array.joinWith(Belt_Array.make(level + 1 | 0, " "), "", (function (prim) {
                      return String(prim);
                    })), "file", f.path, f.size);
        }));
  Belt_Array.forEach(root.dirs, (function (__x) {
          ppDir(__x, level + 1 | 0);
        }));
}

console.log(Belt_Array.reduce(Belt_Array.keepMap(findDir(root), (function (a) {
                var size = dirSize(a);
                if (size >= requiredSize) {
                  return [
                          a.path,
                          size
                        ];
                }
                
              })), [
          "/",
          rootSize
        ], (function (param, param$1) {
            var curSize = param$1[1];
            var accSize = param[1];
            if (curSize < accSize) {
              return [
                      param$1[0],
                      curSize
                    ];
            } else {
              return [
                      param[0],
                      accSize
                    ];
            }
          })));

exports.root = root;
exports.input = input;
exports.length = length;
exports.dirSize = dirSize;
exports.rootSize = rootSize;
exports.requiredSize = requiredSize;
exports.findDir = findDir;
exports.ppDir = ppDir;
/* input Not a pure module */
