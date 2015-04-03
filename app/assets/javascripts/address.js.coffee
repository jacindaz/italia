$(document).on('change', '#address_check_box_tag', ->
  if @.checked
    $('.new-address-checkbox-js').addClass('margin-half-top')
    $('.new-address-js').show()
  else
    $('.new-address-checkbox-js').removeClass('margin-half-top')
    $('.new-address-js').hide()
  )
