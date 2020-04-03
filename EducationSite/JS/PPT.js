function changeSrc(number) {


    var iframe = document.getElementById("iFrame");

    switch (number) {
        case 1:
            // alert("ok");
            iframe.src = 'PDF/HTML-01.pdf';
            break;

        case 2:
            iframe.src = 'PDF/HTML-2.pdf';
            break;

        case 3:
            iframe.src = 'PDF/CSS-1.pdf';
            break;

        case 4:
            iframe.src = 'PDF/CSS-2.pdf';
            break;

        case 5:
            iframe.src = 'PDF/CSS-3.pdf';
            break;

        case 6:
            iframe.src = 'PDF/JS-1.pdf';
            break;

        case 7:
            iframe.src = 'PDF/JS-2.pdf';
            break;

        case 8:
            iframe.src = 'PDF/08-Servlet.pdf';
            break;

        case 9:
            iframe.src = 'PDF/09-JSp.pdf';
            break;


    }


}

//通过url获取要下载的文件，并下载
function downloadFile(url)
{
    try{
        var elemIF = document.createElement("iframe");
        elemIF.src = url;
        elemIF.style.display = "none";
        document.body.appendChild(elemIF);
    }catch(e){

    }
}

//<!--如何判断一个checkbox是否被选中-->
function selectOne() {
    var names = document.getElementsByName("ppt");//获得所有的checkbox

    // alert(names.length);

    var flag = false;

    for (var i=0;i<names.length;i++){
        if (names[i].checked){//确定复选框是否选中
            flag = true;
            names[i].checked = false;//下载的同时将选中清空
            download(i);

        }
    }

    if (!flag){
        alert("请至少选择一项！");
        return false;
    }

}

//专门下载ppt的函数
function download(i){
    switch (i+1) {
        case 1:
            downloadFile("PPT/Web技术01-HTML-1.pptx");
            break;

        case 2:
            downloadFile("PPT/Web技术02-HTML-2.pptx");
            break;

        case 3:
            downloadFile("PPT/Web技术03-CSS-1.pptx");
            break;

        case 4:
            downloadFile("PPT/Web技术04-CSS-2.pptx");
            break;

        case 5:
            downloadFile("PPT/Web技术05-CSS-3.pptx");
            break;

        case 6:
            downloadFile("PPT/Web技术06-JS-1.pptx");
            break;

        case 7:
            downloadFile("PPT/Web技术07-JS-2.pptx");
            break;

        case 8:
            downloadFile("PPT/Web技术08-Servlet.ppt");
            break;

        case 9:
            downloadFile("PPT/Web技术09-JSP.ppt");
            break;

         case 10:
            downloadFile("PPT/Web技术10-会话JDBC.ppt");
            break;

        case 11:
            downloadFile("PPT/Web技术11-EL、JSTL.ppt");
            break;

        case 12:
            downloadFile("PPT/Web技术12-其他专题.ppt");
            break;

        case 13:
            downloadFile("PPT/Web技术13-SSH-1.ppt");
            downloadFile("PPT/Web技术14-SSH-2.ppt");
            break;

        case 14:
            downloadFile("PPT/Web技术15-Vue.ppt");
            break;

        case 15:
            downloadFile("PPT/Web技术16-开发案例.ppt");
            break;

    }
}