$('#sidebar').affix offset:
  top: 100,
  bottom: ->
    @bottom = $('.footer').outerHeight(true)
    
  
