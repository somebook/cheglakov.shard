jQuery ->
  $(document).on 'mouseup', (e) ->
    container = $(".calendar nav")
    if (container.has(e.target).length == 0)
      container.fadeOut(100)
  
  $(".cal-toggle").on 'click', (e) ->
    $(".calendar nav").fadeToggle(100)
    false

  $(".calendar nav").hide(0)
    
  $(".calendar .arr.next").on 'click', (e) ->
    obj = $(".calendar .year.active")
    if $(obj).next().hasClass("year")
      $(obj).next().addClass("active")
      $(obj).removeClass("active")
    check_arrows()
    false
    
  $(".calendar .arr.prev").on 'click', (e) ->
    obj = $(".calendar .year.active")
    if $(obj).prev().hasClass("year")
      $(obj).prev().addClass("active")
      $(obj).removeClass("active")
    check_arrows()
    false
    
  check_arrows()
    
check_arrows = ->
  if $(".calendar .year.active").next().hasClass("year")
    $(".calendar .arr.next").removeClass("disabled")
  else
    $(".calendar .arr.next").addClass("disabled")
  if $(".calendar .year.active").prev().hasClass("year")
    $(".calendar .arr.prev").removeClass("disabled")
  else
    $(".calendar .arr.prev").addClass("disabled")