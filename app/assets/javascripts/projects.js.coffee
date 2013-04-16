jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.control-group').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('.project-thumb').on 'click', (event) ->
    projectid = $(this).data('project-id')

    $.ajax '/projects/' + projectid + '/images',
    type: 'GET'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      console.log 'error'
    success: (data, textStatus, jqXHR) ->
      console.log data

    $('#slidescontainer').show()
    event.preventDefault()

  $('#slideclose').on 'click', (event) ->
    $('#slidescontainer').hide()
    event.preventDefault()

  $('#categories li a').on 'click', (event) ->
    catid = $(this).data('cat-id')
    if catid == 'all'
      $('#projects li').show()
    else
      $('#projects li').each (index) ->
        console.log this
        if $(this).data('cat-id') != catid
          $(this).hide()
        else
          $(this).show()
    event.preventDefault()

