$(document).on 'turbolinks:load', ->
  launchDatepicker()
  return

launchDatepicker = ->
  $('.datepicker').datepicker
    format: 'yyyy-mm-dd'
    startDate: '-3d'
  return