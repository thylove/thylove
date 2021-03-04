/**
 *切换方块的背景色
 *
 *
 */

function rgb(a) {
	var r = Math.floor(Math.random() * 255);
	var rr = 255 - r;
	var g = Math.floor(Math.random() * 255);
	var rg = 255 - g;
	var b = Math.floor(Math.random() * 255);
	var rb = 255 - b;
	if(a == 0)
		return "rgb(" + r +"," + g + "," + b +")";
	else 
		return "rgb(" + rr +"," + rg + "," + rb +")";
		
}
for(var i = 0; i < $(".souye span").length; i ++) {
	$(".souye span a")[i].style.backgroundColor=rgb(0);
	$(".souye span a")[i].style.color=rgb(1);
}


$(".registerrepwd").blur(function () {
	if($(".registerrepwd").val() != $(".registerpwd").val()){
		alert("密码和确认密码不一致！");
	}
})
$(".registerBtn").click(function() {
	if($(".registerusername").val() == "") {
		alert("请输入用户名！");
		return false;
	} else if($(".registerPwd").val() == ""){
		alert("请输入密码！");
		return false;
	} else if($(".registeraliasname").val() == ""){
		alert("请输入昵称！");
		return false;
	} else if($(".registeremail").val() == ""){
		alert("请输入电子邮件！");
		return false;
	} else if($(".registerrepwd").val() != $(".registerpwd").val()){
		alert("密码和确认密码不一致！");
		$(".registerrepwd")[0].focus();
		return false;
	} 
		return true;
})


$(".repwd").blur(function () {
	if($(".repwd").val() != $(".repwd").val()){
		alert("密码和确认密码不一致！");
	}
})



$(".repwdbtn").click(function() {
	if($(".alterPwd").val() == ""){
		alert("请输入密码！");
		return false;
	} else if($(".repwd").val() != $(".alterPwd").val()){
		alert("密码和确认密码不一致！");
		$(".repwd")[0].focus();
		return false;
	} 
		return true;
})

function nodel() {
	if($("#uname").text() == admin) {
		this.css("href", "#");
		alert("admin 用户不可以删除！");
	}
}
$(".nodel").click(function(){
    alert("不能删除管理员！");
});


$(".note").click(function(){
    var rs = confirm("确定要删？");
    
    console.log(rs == false);
    if(rs == false) {
    	return false;
    }
});




