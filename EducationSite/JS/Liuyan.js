
var i = 100;//计算留言的条数

<!-- 提交留言 -->
function f() {

        var yes;

        yes = confirm("你确定要提交留言吗？");

        if (yes){

            var leave = $("#this");
            var message = document.getElementById('message');
            var result = message.value.replace(/\s+/g,"");
            message.value = "";

            if (result!=null&&result!==""){
                leave.append("<textarea style='text-shadow: 5px 5px 5px black, 0px 0px 2px red, 2px 2px 3px green;font-size: 20px;text-align: center; resize:none;background:transparent'>"+result+"</textarea>");//必须通过jquery得到的变量才能使用“方法”

                leave.append("<input type='button' onclick='reply_leave("+i+")' value='回复' class='new_button' name='ss' id='"+i+"'><br>");//动态创建id
                //<input type="button" id="yes2" name="reply" onclick="reply_leave()" value="回复" class="new_button">

                // alert($("#"+i).val());

                i++;

            }else {

                alert("您的留言是空的，留言失败！");

            }
        }else {
            alert("留言失败！");
        }

    }

function reply_leave(j){//小心重名

        var message=prompt("请写入您回复的内容","");

        if (message!=null && message!=="") {

            var number = j-100;

            // alert(number);

            var parent = $("input[name='ss']").get(number);//通过名字得到了值

            // alert(parent);

            //太重要了
            //append() - 在被选元素的结尾插入内容
            // prepend() - 在被选元素的开头插入内容
            // after() - 在被选元素之后插入内容
            // before() - 在被选元素之前插入内容


            // parent.after("<textarea style='text-shadow: 5px 5px 5px black, 0px 0px 2px black; /* 没错这里设置了两个 shadow */font-size: 15px;text-align: center; resize:none;background: transparent;color: black'>"+message+"</textarea><br>");

            parent.after("                    "+message+"。 ");

        }
}



function getKeyCode(e) {

    alert("OK");

    var keynum;
    var keychar;
    var numcheck;

    if (window.event){ // IE
        keynum = e.keyCode;
    } else if (e.which){ // Netscape/Firefox/Opera
        keynum = e.which;
    }

    keychar = String.fromCharCode(keynum);

    alert(keychar+":"+keynum);
}