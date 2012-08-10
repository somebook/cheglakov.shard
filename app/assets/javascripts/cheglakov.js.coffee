//= require modernizr
//= require jquery
//= require_tree ./cheglakov
//= require jquery.lightbox-0.5
//= require jquery_cookie
//= require fotorama

jQuery ->
  $(".next_page").live 'click', (e) ->
    $(this).parent().addClass("loading")
    el = $(this)
    if $(this).attr("href").search("/blog/more") == 0
      url = $(this).attr("href")
    else
      url = "/blog/more" + $(this).attr("href")
    $.ajax({
      url: url,
      success: (data) ->
        el.parent().before(data)
        el.parent().remove()
        $(".next_page").each(
          ->
            if $(this).hasClass("disabled") then $(this).parent().hide()
        )
        fotoramajser()
        lightboxer()
    })
    false

  $(".ajax-pagination").each(
    ->
      if $(this).find(".next_page").attr("href") == undefined
        $(this).hide()
  )

  fotoramajser = ->
    $(".fotoramajs").fotorama({
      width: "100%",
      height: "auto",
      loop: true,
      nav: 'dots'
    })
  
  $(".pull-left a:has(.icon.page-down)").live 'click', (e) ->
    $('html, body').animate(
      scrollTop: $("body .page").height()
      800
    )
    false
    
  $(".page-move a:has(.icon.page-up)").live 'click', (e) ->
    $('html, body').animate(
      scrollTop: 0
      800
    )
    false

  lightboxer()
  fotoramajser()

lightboxer = ->
  $('.post p img').wrap(
    ->
      unless $(this).parent().attr("rel") == "lightbox"
        '<a rel="lightbox" href="' + $(this).attr("src") + '">'
  )
  $('a[rel=lightbox]').lightBox({
    imageLoading:  '/assets/lightbox/lightbox-ico-loading.gif'
    imageBtnClose: '/assets/lightbox/lightbox-btn-close.gif'
    imageBtnPrev:  '/assets/lightbox/lightbox-btn-prev.gif'
    imageBtnNext:  '/assets/lightbox/lightbox-btn-next.gif'
    imageBlank:    '/assets/lightbox/lightbox-blank.gif'
  })