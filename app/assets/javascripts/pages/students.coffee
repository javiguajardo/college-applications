# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  addFields()
  removeFields()
  return

addFields = ->
  $form = $('form')

  $form.on 'click', '.add_fields', (e) ->
    $this = $(this)
    time = new Date().getTime()
    regexp = new RegExp($this.data('id'), 'g')
    
    $this.closest('.form-group').before($this.data('fields').replace(regexp, time))
    select2Init()
    e.preventDefault()
    return
  return

removeFields = ->
  $form = $('form')

  $form.on 'click', '.remove_fields', (e) ->
    $this = $(this)

    $this.prev('input[type=hidden]').val('1')
    $this.closest('fieldset').hide()
    e.preventDefault()
    return
  return

select2Init = ->
  $('.select-two').select2(
    theme: 'bootstrap'
  )
  return