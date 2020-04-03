function ChangeColor(ColorName) {
    document.getElementById("di3").style.backgroundColor = ColorName;
}

function click() {
    alert("hello");
}

//获得视频
function getVideo1(number) {
    switch (number) {

        case 1:
            document.querySelector('#play').src = "Video/HTML1.mp4";//更改视频的播放源
            break;

        case 2:
            document.querySelector('#play').src = "Video/css1.mp4";//更改视频的播放源
            break;

        case 3:
            document.querySelector('#play').src = "Video/js1.mp4";//更改视频的播放源
            break;

    }

}
function getVideo2(number) {

    switch (number) {

        case 1:
            document.querySelector('#play').src = "Video/HTML2.mp4";//更改视频的播放源
            break;

        case 2:
            document.querySelector('#play').src = "Video/css2.mp4";//更改视频的播放源
            break;

        case 3:
            document.querySelector('#play').src = "Video/js2.mp4";//更改视频的播放源
            break;

    }

}
function getVideo3(number) {

    switch (number) {

        case 1:
            document.querySelector('#play').src = "Video/HTML3.mp4";//更改视频的播放源
            break;

        case 2:
            document.querySelector('#play').src = "Video/css3.mp4";//更改视频的播放源
            break;

        case 3:
            document.querySelector('#play').src = "Video/js3.mp4";//更改视频的播放源
            break;

    }

}
function getVideo4(number) {

    switch (number) {

        case 1:
            document.querySelector('#play').src = "Video/HTML4.mp4";//更改视频的播放源
            break;

        case 2:
            document.querySelector('#play').src = "Video/css4.mp4";//更改视频的播放源
            break;

        case 3:
            document.querySelector('#play').src = "Video/js4.mp4";//更改视频的播放源
            break;

    }

}
function getVideo5(number) {

    switch (number) {

        case 1:
            document.querySelector('#play').src = "Video/HTML5.mp4";//更改视频的播放源
            break;

        case 2:
            document.querySelector('#play').src = "Video/css5.mp4";//更改视频的播放源
            break;

        case 3:
            document.querySelector('#play').src = "Video/js5.mp4";//更改视频的播放源
            break;

    }
}

//改变视频播放单和视频下载序列
function changeVideo() {

    var myValue = $('#getVideo option:selected').val();//获得下拉框中的值

    var html = $('#html');
    var css = $('#css');
    var js = $('#js');

    var html_d = $('#download_html');
    var css_d = $('#download_css');
    var js_d = $('#download_js');

    // alert(myValue);

    switch (myValue) {
        case "html":

            document.querySelector('#play').src = "Video/HTML1.mp4";

            html.show();
            css.hide();
            js.hide();

            html_d.show();
            css_d.hide();
            js_d.hide();
            break;

        case "css":

            document.querySelector('#play').src = "Video/css1.mp4";

            html.hide();
            css.show();
            js.hide();

            html_d.hide();
            css_d.show();
            js_d.hide();
            break;

        case "js":

            document.querySelector('#play').src = "Video/js1.mp4";

            html.hide();
            css.hide();
            js.show();

            html_d.hide();
            css_d.hide();
            js_d.show();
            break;

    }

}