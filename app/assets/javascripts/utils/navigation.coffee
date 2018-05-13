$(document).on 'turbolinks:load', ->
  activeNavLink()
  return

activeNavLink = ->
  current = location.pathname
  $('.nav li a').each ->
    $this = $(this)

    if $this.attr('href').indexOf(current) != -1
      $this.addClass('active')
    return
  return