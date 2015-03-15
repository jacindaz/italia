$ -> 
  $('#address_check_box_tag').on('change', ->
    if @.checked
      $('.existing-address-submit').hide()
      $('.address-dropdown').hide()
      $('.new-address-checkbox').addClass('margin-half-top')
      $('.new-address').show()
    else
      $('.existing-address-submit').show()
      $('.address-dropdown').show()
      $('.new-address-checkbox').removeClass('margin-half-top')
      $('.new-address').hide()
    )