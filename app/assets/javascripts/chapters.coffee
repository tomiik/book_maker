@ChapterUtils =
  hideNewChapterForm: ->
    $('#new-chapter-form')[0].reset()
    $('#new-chapter-form').hide()
    $('#new-chapter-form-trigger').show()

  bindNewChapterCancelLink: ->
    $('#cancel-new-chapter-form').on 'click', ->
      ChapterUtils.hideNewChapterForm()

$ ->
  $('#new-chapter-form').hide()
  $('#new-chapter-form-trigger').on 'click', ->
    console.log("a")
    $('#new-chapter-form').show()
    $(@).hide()
  ChapterUtils.bindNewChapterCancelLink()
