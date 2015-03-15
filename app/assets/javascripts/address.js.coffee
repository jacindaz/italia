$ -> 
  $('#address_check_box_tag').on('change', ->
    if @.checked
      $('.address-dropdown').hide()
      $('.new-address-checkbox').addClass('margin-half-top')
      $('.new-address').show()
    else
      $('.address-dropdown').show()
      $('.new-address').hide()
    )