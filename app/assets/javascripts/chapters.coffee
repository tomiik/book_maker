@ChapterUtils =
  hideNewChapterForm: ->
    $('#new-chapter-form')[0].reset()
    $('#new-chapter-form').hide()
    $('#new-chapter-form-trigger').show()

  bindNewChapterCancelLink: ->
    console.log("cancel")
    $('#cancel-new-chapter-form').on 'click', ->
      ChapterUtils.hideNewChapterForm()
      return false #this is for disable hyper link


readyC = ->
  $('#new-chapter-form').hide()
  $('#new-chapter-form-trigger').click ->
    console.log("chapter-ready")
    $('#new-chapter-form').show()
    $(@).hide()
    return false #this is for disable hyper link
  ChapterUtils.bindNewChapterCancelLink()

$(document).ready(readyC)

$(document).on 'ready page:load', ->
$(document).on('page:load', readyC)
$(document).on('page:change', readyC)
