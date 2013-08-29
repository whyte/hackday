# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->  
  $(".add_skills li").click ->
    skill = $(this).attr('data-skill')
    $(this).toggleClass('add_skill')
    input = $('#skill_'+skill)
    if input.length == 0
     console.log(input.length)
     add_skill(skill)
    else
     input.remove()

  $(".add_skills li").mouseenter ->
    $(this).addClass('hover_skill')

  $(".add_skills li").mouseleave ->
    $(this).removeClass('hover_skill')

add_skill = (id) ->
  $('<input>').attr(
    type: 'hidden'
    id: 'skill_'+id
    name: 'skills['+id+']').appendTo('form#user_form')

		