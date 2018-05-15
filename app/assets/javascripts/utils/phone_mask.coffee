$(document).on 'turbolinks:load', ->
  phoneMask()
  return

phoneMask = ->
  selector = $(".phone-mask")
  im = new Inputmask mask: '(9{3}) 9{3} - 9{4}'
  im.mask(selector)
  return
