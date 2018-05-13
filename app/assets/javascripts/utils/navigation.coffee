$(document).on 'turbolinks:load', ->
  activeNavLink()
  return

activeNavLink = ->
  current = location.pathname
  $('.nav li a').each ->
    $this = $(this)

    if $this.attr('href') == current
      $this.addClass('active')
    return
  return
