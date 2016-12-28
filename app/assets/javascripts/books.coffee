ChapterSorter =
  orderedChapterIds: ->
    JSON.stringify $('#chapters-list').sortable('toArray').map (eleId) ->
      eleId.split("_")[1]

  saveNewSortOrder: ->
    console.log(JSON.stringify(ChapterSorter.orderedChapterIds()))
    $.ajax
      method: "PUT"
      url: "/books/#{$('#book')[0].dataset.bookId}",
      dataType: "script"
      data:
        book:
          sorted_chapter_ids: ChapterSorter.orderedChapterIds()


  init: ->
    $('#chapters-list').sortable
      handle: '.fa-bars'
      cursor: 'move'
      items: '> .chapter'
      placeholder: 'sortable-placeholder'
      update: ->
        ChapterSorter.saveNewSortOrder()


readyB = ->
  console.log("ready")
  $('#book #sidebar #chapters-list .chapter .chapter-title').click (ev)->
    ev.preventDefault()
    $(@).parents('.chapter').toggleClass('expand')


  ChapterSorter.init()


$(document).ready(readyB)

$(document).on 'readyB page:load', ->
$(document).on('page:load', readyB)
$(document).on('page:change', readyB)
