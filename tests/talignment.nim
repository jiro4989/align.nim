import unittest
import strutils
import alignment

doAssert "a".len == 1
doAssert "あ".len == 3
doAssert "a".alignLeft(5) == "a    "
doAssert "あ".alignLeft(5) == "あ  "
doAssert "a".alignLeft(5).len == 5
doAssert "あ".alignLeft(5).len == 5

doAssert "abcd".alignLeft(6) == "abcd  "
doAssert "abcd".align(6) == "  abcd"
doAssert "あい".alignLeft(6) == "あい" # あ == 3byte
doAssert "あい".align(6) == "あい" # あ == 3byte
doAssert " ".repeat(0).join == ""

suite "alignLeft":
  test "Half width and full width":
    check @["Hello", "こんにちは"].alignLeft == @[
      "Hello     ",
      "こんにちは",
      ]
    check @["こんにちは", "Hello"].alignLeft == @[
      "こんにちは",
      "Hello     ",
      ]
    check @["こんにちは", "Hello", "1"].alignLeft == @[
      "こんにちは",
      "Hello     ",
      "1         ",
      ]
  test "Pad = x":
    check @["Hello1", "こんにちは"].alignLeft(pad = "x") == @[
      "Hello1xxxx",
      "こんにちは",
      ]
  test "Pad is multibyte string":
    check @["Hello1", "こんにちは"].alignLeft(pad = "　") == @[
      "Hello1　　",
      "こんにちは",
      ]
    check @["Hello", "こんにちは"].alignLeft(pad = "あ") == @[
      "Hello ああ",
      "こんにちは",
      ]
  test "Count of data is 1":
    check @["Hello"].alignLeft == @["Hello"]
  test "Count of data is empty":
    var empty: seq[string]
    check empty.alignLeft == empty
  test "Pad is empty":
    check @["Hello1", "こんにちは"].alignLeft(pad = "") == @[
      "Hello1",
      "こんにちは",
      ]

suite "alignCenter":
  test "Half width and full width (odd)":
    check @["Hello", "こんにちは"].alignCenter == @[
      "  Hello   ",
      "こんにちは",
      ]
    check @["こんにちは", "Hello"].alignCenter == @[
      "こんにちは",
      "  Hello   ",
      ]
    check @["こんにちは", "Hello", "1"].alignCenter == @[
      "こんにちは",
      "  Hello   ",
      "    1     ",
      ]
  test "Half width and full width (even)":
    check @["Hello1", "こんにちは"].alignCenter == @[
      "  Hello1  ",
      "こんにちは",
      ]
  test "Pad = x":
    check @["Hello1", "こんにちは"].alignCenter(pad = "x") == @[
      "xxHello1xx",
      "こんにちは",
      ]
  test "Pad is multibyte string":
    check @["Hello1", "こんにちは"].alignCenter(pad = "あ") == @[
      "あHello1あ",
      "こんにちは",
      ]
    check @["Hello", "こんにちは"].alignCenter(pad = "あ") == @[
      "あHello あ",
      "こんにちは",
      ]
    check @["Hello1", "こんにちは"].alignCenter(pad = "　") == @[
      "　Hello1　",
      "こんにちは",
      ]
    check @["Hello", "こんにちは"].alignCenter(pad = "　") == @[
      "　Hello 　",
      "こんにちは",
      ]
  test "Count of data is 1":
    check @["Hello"].alignCenter == @["Hello"]
  test "Count of data is empty":
    var empty: seq[string]
    check empty.alignCenter == empty
  test "Pad is empty":
    check @["Hello1", "こんにちは"].alignCenter(pad = "") == @[
      "Hello1",
      "こんにちは",
      ]

suite "alignRight":
  test "Half width and full width":
    check @["Hello", "こんにちは"].alignRight == @[
      "     Hello",
      "こんにちは",
      ]
    check @["こんにちは", "Hello"].alignRight == @[
      "こんにちは",
      "     Hello",
      ]
    check @["こんにちは", "Hello", "1"].alignRight == @[
      "こんにちは",
      "     Hello",
      "         1",
      ]
  test "Pad = x":
    check @["Hello1", "こんにちは"].alignRight(pad = "x") == @[
      "xxxxHello1",
      "こんにちは",
      ]
  test "Pad is multibyte string":
    check @["Hello1", "こんにちは"].alignRight(pad = "　") == @[
      "　　Hello1",
      "こんにちは",
      ]
    check @["Hello", "こんにちは"].alignRight(pad = "あ") == @[
      "ああ Hello",
      "こんにちは",
      ]
  test "Count of data is 1":
    check @["Hello"].alignRight == @["Hello"]
  test "Count of data is empty":
    var empty: seq[string]
    check empty.alignRight == empty
  test "Pad is empty":
    check @["Hello1", "こんにちは"].alignRight(pad = "") == @[
      "Hello1",
      "こんにちは",
      ]