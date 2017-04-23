$(function(){
	//设置每个查询按钮的href 
	//目录
	$("#maincate>a").attr("href","./getGoods?action=search&searchText="); 
	for (var i = 0; i < 3; i++) { 
		$(".s-category:eq("+i+")").attr("href","./getGoods?action=search&searchby=mainClass&searchText="+$(".s-category:eq("+i+")").text());
	} 
	for(var i = 0; i < 4; i++) {
		for (var j = 0; j < 3; j++) {
			$(".cate-selection:eq("+i+")>a:eq("+j+")").attr("href","./getGoods?action=search&searchBy=subClass&searchText="+$(".cate-selection:eq("+i+")>a:eq("+j+")").text());    
		}
	} 
	//前后翻页按钮
    $("#pageUp").attr("href","./getGoods?action=changePage&direction=front");
    $("#pageDown").attr("href","./getGoods?action=changePage&direction=back");
	//数字翻页按钮
    for (var i = 1; i < $("#pageItems>li").length-1; i++) { 
		var array_element = $("#pageItems>li>a:eq("+i+")"); 
		array_element.attr("href","./getGoods?action=changePage&pageNumber="+array_element.text());
	} 
});