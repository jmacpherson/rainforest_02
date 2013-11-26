# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 $(document).ready ->
  $("#new_review").bind("ajax:beforeSend", ->
    $("input[type='submit']").val("Saving...").attr "disabled", "disabled"
  ).bind "ajax:complete", ->
    $("input[type='submit']").val("Create Review").removeAttr "disabled"