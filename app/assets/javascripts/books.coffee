ChapterSorter =
  orderedChapterIds: ->
    JSON.stringify
    $('#chapters-list').sortable('toArray').map (eleId) ->
      eleId.split("_")[1]

  saveNewSortOrder: ->
    console.log(JSON.stringify(ChapterSorter.orderedChapterIds()))
    $.ajax
      method: "PUT"
      url: "/books/#{$('#book')[0].dataset.bookId}/chapters/sort",
      dataType: "script"
      data:
        chapter_ids: JSON.stringify(ChapterSorter.orderedChapterIds())      


  init: ->
    $('#chapters-list').sortable
      handle: '.fa-bars'
      cursor: 'move'
      items: '> .chapter'
      placeholder: 'sortable-placeholder'
      update: ->
        ChapterSorter.saveNewSortOrder()


ready = ->
  console.log("ready")
  $('#book #sidebar #chapters-list .chapter .chapter-title').click (ev)->
    ev.preventDefault()
    $(@).parents('.chapter').toggleClass('expand')

  $('#book #sidebar #chapters-list .chapter .chapter-title').click (ev)->
    ev.preventDefault()
    $(@).parents('.chapter').toggleClass('expand')

  ChapterSorter.init()


$(document).ready(ready)

$(document).on('page:load', ready)
$(document).on('page:change', ready)
