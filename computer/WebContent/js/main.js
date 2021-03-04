$(document).ready(function() {
// $(".nav-list h3").first().addClass('open').next('ul').slideDown();

//给h3元素绑定单击事件
	$(".nav-list h3").click(function(){
		$(this)					//当前点击的 h3
		.toggleClass('open')  		//当前h3切换open类
		.siblings('h3')
		.removeClass('open')  	//其他的h3 删除open类
		.end()					//返回最后一次破坏性操作的DOM h3  就是返回$(this)
		.next('ul')
		.slideToggle()			//当前h3 后面的ul显示
		.siblings('ul')			
		.slideUp();				//其他ul隐藏
		
	// $(this).addClass('open').next('ul').slideDown().siblings('ul').slideUp();
	});
	$(".username").mouseenter(function() {
		$(".delico").css("display", "inline-block");
	});
	$(".delico").mouseleave(function() {
		$(".delico").css("display", "none");
	});
	

	
	if($(".gly").text() == "销售员"){
		$(".xiao a").attr("href", "#").css('color', '#999').click(function() {
			alert("暂无权限！");
		});
	} else if($(".gly").text() == "管理员") {
		$(".adm a").attr("href", "#").css('color', '#999').click(function() {
			alert("暂无权限！");
		});
	} else if($(".gly").text() == "采购员") {
		$(".cai a").attr("href", "#").css('color', '#999').click(function() {
			alert("暂无权限！");
		});
	} else {
		$(".nav-list a").attr("href", "#").css('color', '#999').click(function() {
			alert("暂无权限！");
		});
	}
	
	
	
	
	
	
	
	
	
	
});