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
    if $('#slides'+projectid).length > 0
      $('#slides'+projectid).show()
    else
      slides = $('<div id="slides'+projectid+'" class="slider">')
      $.ajax '/projects/' + projectid + '/images',
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log 'error'
      success: (data, textStatus, jqXHR) ->
        $.each data, (index, value) ->
          imgtag = $('<img>')
          imgtag.attr('src', value)
          slides.append(imgtag)
          $('#slideshowindex').append(slides)

        slides.slidesjs({width: 932, height: 697, navigation: { effect: "fade" }, pagination: { effect: "fade" }, effect: { fade: {speed: 300, crossfade: true }}})

    $('#slideshowindex').css('top', ($(window).scrollTop() - 50) + "px")
    scrollHeight = $(window).scrollTop() + 900
    documentHeight = $(document).height()
    if scrollHeight > documentHeight
      $('#slidescontainer').css('height', scrollHeight + "px")
    else
      $('#slidescontainer').css('height', documentHeight + "px")
    $('#slidescontainer').show()
    event.preventDefault()

  $('#portfolioLink').on 'click', (event) ->
    $('html, body').animate({ scrollTop: $("#portfolio").offset().top - 83 }, 1000)
    event.preventDefault()

  $('#homeLink').on 'click', (event) ->
    $('html, body').animate({ scrollTop: "0px" }, 1000)
    event.preventDefault()

  $('#slideclose').on 'click', (event) ->
    $('.slider').hide()
    $('#slidescontainer').hide()
    event.preventDefault()

  $('#categories li a').on 'click', (event) ->
    catid = $(this).data('cat-id')
    if catid == 'all'
      $('#projects li').each (index) ->
        if (index+1)%3 == 0
          $(this).addClass('right')
        else
          $(this).removeClass('right')
        $(this).show()
    else
      counter = 0;
      $('#projects li').each (index) ->
        console.log this
        if $(this).data('cat-id') != catid
          $(this).hide()
        else
          counter += 1;
          if counter%3 == 0
            $(this).addClass('right')
          else
            $(this).removeClass('right')
          $(this).show()
    event.preventDefault()
  $('#projects li').hover \
    (-> $(this).find('.description').fadeIn(300)), \
    (-> $(this).find('.description').fadeOut(300))
  $(window).scroll ->
    yPos = ($(window).scrollTop() *.5) - 60
    coords = '50% '+ yPos + 'px'
    $('#taglines').css({ backgroundPosition: coords })
  $(window).resize ->
    $("#portfolio").css('min-height', $(window).height() + "px")
  $("#portfolio").css('min-height', $(window).height() + "px")

