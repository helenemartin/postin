# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("document").ready ->
  $("div.content").embedly
    maxWidth: 450
    wmode: "transparent"
    method: "replace"
    key: ":d71f38d2305e11e1b6634040d3dc5c07"