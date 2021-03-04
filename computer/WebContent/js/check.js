var arr = [2,3,4,5,6,7,8,9];
for(var i = 65; i < 122; i ++) {
	if(i > 90 && i < 97) {
		continue;
	}
	arr.push(String.fromCharCode(i));
}
var value;
function createCanvas() {
	var canvasStr = '';
	value = '';
	for(var i = 0; i < 4; i ++) {
		var a = arr[Math.floor(Math.random() * arr.length)];
		canvasStr += a + ' ';
		value += a;
	}
	var myCanvas = document.getElementById('myCanvas');
	var ctx = myCanvas.getContext('2d');
	var oImg = new Image();
	
	oImg.src = getRootPath() + '/img/bg.png';
	
	oImg.onload = function() {
		var pattern = ctx.createPattern(oImg, 'repeat');
		ctx.fillStyle = pattern;
		ctx.fillRect(0, 0, myCanvas.width, myCanvas.height);
		ctx.textAlign = 'center';
		ctx.fillStyle = '#ccc';
		ctx.font = '50px Roboto Slab';
		ctx.setTransform(1, -0.12, 0.3, 1, -5, 45);
		ctx.fillText(canvasStr, myCanvas.width/2, 60);
	}
}
createCanvas();

$('.check').blur(function(){
    showResule();
});
$('#myCanvas').on('click', function() {
	createCanvas();
});
function showResule() {
	var inputValues = $('.c input').val().toLowerCase();
	if(value.toLowerCase() != inputValues) {
		$('.btn').attr('type', 'button');
		$('.check').html('');
		$('.error').html('验证码错误，请重新输入!');
		createCanvas();
	}else{
		$('.btn').attr('type', 'submit');
		$('.error').html('');
		createCanvas();
	}
}

function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}