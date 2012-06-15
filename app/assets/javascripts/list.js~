
var List = function(){
	var api = {};

	api.remove_fields = function(link){
	 	$(link).prev("input[type=hidden]").val("1");
  		$(link).closest("#task_input").hide();
	};

	api.add_fields = function(link, association, content){
		var new_id = new Date().getTime();
  		var regexp = new RegExp("new_" + association, "g")
  		$('#tasks').append(content.replace(regexp, new_id));
	};

	return api;

}
