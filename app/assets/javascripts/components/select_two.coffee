$(document).on 'turbolinks:load', ->
  select2Init()
  return

select2Init = ->
  $('.select-two').select2(
    theme: 'bootstrap'
  )
  return