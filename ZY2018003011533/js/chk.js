// JavaScript Document




function click() {

	alert("sssssssssss");

	// var len = document.getElementsByClassName("s");//


}


var len = document.getElementsByName("i");
var pos = 0;
function changeimage(){

	len[pos].style.display = "none";
	pos++;
	if(pos === len.length) pos=0;
	len[pos].style.display = "block";

}
setInterval("changeimage()",2000);//每过2秒轮播一次

function addclass(id){
	document.getElementById(id).className = 'nav_cur';
}
function removeclass(id){
	document.getElementById(id).className = 'd';
}
// alert("aaaaaaaaaaaaa");





function changeSrc(src) {

	// alert(src);

	var src1 = $("#a1-1");
	var src2 = $("#a2-1");
	var src3 = $("#a3-1");

	switch (src) {
		case 1:
			src1.show();
			src2.hide();
			src3.hide();
			break;

		case 2:
			src2.show();
			src1.hide();
			src3.hide();
			break;

		case 3:
			src3.show();
			src2.hide();
			src1.hide();
			break;

	}


}