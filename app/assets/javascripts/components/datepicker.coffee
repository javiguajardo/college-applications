$(document).on 'turbolinks:load', ->
  launchDatepicker()
  return

launchDatepicker = ->
  $('.datepicker').datepicker
    format: 'yyyy-mm-dd'
    autoclose: true
  return