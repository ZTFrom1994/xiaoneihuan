$(function(){
	$().ready(function() {
		 $("#suggestionsForm").validate({
			 submitHandler: function(form) 
			   {      
			      $.ajax({
			    	  url:"./handleSuggestions",
			    	  data:{
			    	  	title:$("#title").val(),
			    	  	content:$("#content").val(),
			    	  	email:$("#email").val()
			      	  },
			      	  type:"post",
			      	  success:function(data){
			      		  if(data==1){
			      			$("#myModalLabel").text("提交成功");
							$("#tipModal").modal("show");
							$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
							setTimeout("$('#tipModal').modal('hide');", 2000);
							setTimeout("location.href='index.jsp'", 2000); 
			      		  }else{
			      			$("#myModalLabel").text("提交失败");
							$("#tipModal").modal("show");
							$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-remove');
							setTimeout("$('#tipModal').modal('hide');", 2000);
			      		  }
			      		
			      	  }
			      })    
			   },  
		        debug:true,
		        rules: {
		  	      title: {
		  	        required: true,
		  	      },
		  	      content: {
		  	        required: true,
		  	      },
		  	      email: {
		  	        required: true,
		  	        email: true
		  	      },
		  	    },
		  	    messages: {
		  	      title: {
		  	        required: "<span class='tips'>*请输入标题</span>",
		  	      },
		  	      email: "<span class='tips'>*请输入一个正确的邮箱</span>",
		  	      content: {
		  	        required: "<span class='tips'>*请输入信息</span>",
		  	      },
		  	    }
		    });
		});
});