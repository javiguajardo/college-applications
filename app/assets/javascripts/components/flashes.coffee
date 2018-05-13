$(document).on 'turbolinks:load', ->
  closeFlashMessage()
  return

closeFlashMessage = ->
  $alert = $('.alert')

  $alert.fadeTo(3000, 500).slideUp 500, ->
    $alert.alert 'close'
    return
  return