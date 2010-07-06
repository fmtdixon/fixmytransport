// Run jquery in no-conflict mode so it doesn't use $()
jQuery.noConflict();

function setupAssignAllAndNone(){
  jQuery('.check-all-route-operators').click(function(){
    var operators = jQuery(this).closest('.route-operators').find('.check-route-operator')
    operators.attr('checked', true);
    operators.parents('tr').toggleClass("selected");
    event.preventDefault();
  })
  
  jQuery('.uncheck-all-route-operators').click(function(){
    var operators = jQuery(this).closest('.route-operators').find('.check-route-operator')
    operators.attr('checked', false);
    operators.parents('tr').toggleClass("selected");
    event.preventDefault();
  })
}

function setupIndexSelectAllAndNone(){
  jQuery('.index-select-all').click(function(){
    var items = jQuery('.index-list').find('.select-item');
    items.attr('checked', true);
    items.parents('tr').toggleClass("selected");
    event.preventDefault();
  })

  jQuery('.index-select-none').click(function(){
    var items = jQuery('.index-list').find('.select-item');
    items.attr('checked', false);
    items.parents('tr').toggleClass("selected");
    event.preventDefault();
  })
}

function setupItemSelection(class_name){
  jQuery(class_name).click(function(){
    jQuery(this).parents('tr').toggleClass("selected");
  });
}

function setupStopAutocomplete(text_input_selector, url_input_selector, target_selector) {
  jQuery(text_input_selector).autocomplete({
    source: function(request, response){
      	jQuery.ajax({
  				url: jQuery(url_input_selector).val(),
  				dataType: "json",
  				data: { term: request.term, transport_mode_id: jQuery('select#route_transport_mode_id').val() },
  				success: function(data){
  				  response(jQuery.map(data, function(item) {
          		return {
          			label: item.name,
          			value: item.name,
          			id: item.id
          		}
          	}))
  				}
  			})
  		},
  		minLength: 0,
  		select: function(event, ui) {
  			jQuery(target_selector).val(ui.item.id);
  		},
  		search: function(event, ui) {
  		  jQuery(target_selector).val('');
  		  if (jQuery(this).val().length == 0){
  		    return false;
  		  }
  		}
  });
}

function setupStopAutocompletes(){
  setupStopAutocomplete('input#from_stop_name_auto', "input#stop_name_autocomplete_url", 'input#from-stop-id');
  setupStopAutocomplete('input#to_stop_name_auto', "input#stop_name_autocomplete_url", 'input#to-stop-id');
}

function setupOperatorAutocomplete(){
  jQuery('input#operator_name_auto').autocomplete({
		source: function(request, response) {
			jQuery.ajax({
				url: jQuery("input#operator_name_autocomplete_url").val(),
				dataType: "json",
				data: { term: request.term },
				success: function(data) {
					response(jQuery.map(data, function(item) {
						return {
							label: item.name,
							value: item.name,
							id: item.id
						}
					}))
				}
			})
		},
    minLength: 0,
		select: function(event, ui) {
			jQuery('input#operator-id').val(ui.item.id);
		},
		search: function(event, ui) {
		  jQuery('input#operator-id').val('');
		  if (jQuery(this).val().length == 0){
		    return false;
		  }
		}
  }); 
}

function setupDestroyOperator(){
  jQuery('.destroy-operator').submit(function(){
    if (confirm(jQuery('input#destroy_operator_confirmation').val())){
      return true;
    }else{
      return false;
    }
  });
}

function setupShowRoute(){
  setupOperatorAutocomplete();
  setupStopAutocompletes();
  setupAssignAllAndNone();
  setupItemSelection('.check-route-operator');
  setupItemSelection('.check-route-segment');
  route_init();
}

function setupNewRoute(){
  setupOperatorAutocomplete();
  setupStopAutocompletes();
  setupAssignAllAndNone();
  setupItemSelection('.check-route-operator');
  setupItemSelection('.check-route-segment');  
}
