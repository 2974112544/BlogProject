


function DoCheck() {
    var ch = document.getElementsByName("ids");
    if (document.getElementById("allSelect").checked == true) {
        for (var i = 0; i < ch.length; i++) {
            ch[i].checked = true;
        }
    } else {
        for (var i = 0; i < ch.length; i++) {
            ch[i].checked = false;
        }
    }
}

function confirmDelete() {
    var msg = "��ȷ��Ҫɾ����";
    if (confirm(msg)==true){
        return true;
    }else{
        return false;
    }
}

//��ȡ���·��
function  getPath(){
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}


//��ʾ������row-actions
$(".dashboard-comment-wrap").mouseenter(function () {
    $(this).find(".row-actions").show();
})
$(".dashboard-comment-wrap").mouseleave(function () {
    $(this).find(".row-actions").hide();
})



//��Ӳݸ�
function insertDraft() {
    if($("#articleContent").val!=""&&$("#articleTitle").val()!="") {
        $.ajax({
            async: false,
            type: "POST",
            url:'/admin/article/insert',
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
        })
    }

}

//ɾ������
function deleteArticle(id) {
    if(confirmDelete()==true){
        $.ajax({
            async: false,
            type: "POST",
            url:'/admin/article/delete/'+id,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
        })
    }
}

//��ѯ����
function queryArticle() {
    //�ύform
    $("#articleForm").attr("action", "/admin/article/search");
    $("#articleForm").submit();
}

//����ɾ������
function confirmDeleteArticleBatch() {
    if(confirmDelete()==true){
        var text = $("input:checkbox[name='ids']:checked").map(function(index,elem) {
            return $(elem).val();
        }).get().join(',');
        $.ajax({
            async: false,
            type: "POST",
            url:'/admin/article/deleteBatch',
            data:{ids:text},
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
        })
    }
}

//�˳���¼
function logout() {
    $.ajax({
        async: false,
        type: "POST",
        url:'/admin/logout',
        contentType : "application/x-www-form-urlencoded; charset=utf-8",
        dataType: "text",
        complete:function () {
            window.location.reload();
        }
    })
}



//����û�����û����Ƿ����
function checkUserName() {
    var result;
    $.ajax({
        async: false,//ͬ������������Ϻ���ִ�к���Ĵ���
        type: "POST",
        url: 'user/checkUserName',
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: {"username": $("#userName").val(), "id": $("#userId").val()},
        dataType: "json",
        success: function (data) {
            //�û�������
            if(data.code==1) {
                $("#userNameTips").html(data.msg);
                result=1;
            }
            //�û���������
            if(data.code==0) {
                $("#userNameTips").html(data.msg);
                result=0;
            }
        },
        error: function () {
            // alert("���ݻ�ȡʧ��")
        }
    })
    return result;
}

//����û������������Ƿ����
function checkUserEmail() {
    var result;
    $.ajax({
        async: false,//ͬ������������Ϻ���ִ�к���Ĵ���
        type: "POST",
        url: '/admin/user/checkUserEmail',
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: {"email": $("#userEmail").val(), "id": $("#userId").val()},
        dataType: "json",
        success: function (data) {
            //�û�������
            if(data.code==1) {
                $("#userEmailTips").html(data.msg);
                result=1;
            }
            //�û���������
            if(data.code==0) {
                $("#userEmailTips").html(data.msg);
                result=0;
            }
        },
        error: function () {
            //alert("���ݻ�ȡʧ��")
        }
    })
    return result;
}



//����û���֤�ͱ༭�û���֤
layui.use(['form', 'layedit', 'laydate'], function () {
    var form = layui.form, layer = layui.layer;
    form.verify({

        userName: function (value) {
            if (value.length > 12 || value.length < 4) {
                return "�û�������4��12λ";
            }
            if(checkUserName()==1) {
                return "�û����Ѵ���";
            }
        },
        userEmail: function () {
            if(checkUserEmail()==1) {
                return "���������Ѵ���";
            }
        }

    });

    /*form.on('submit(demo1)', function (data) {
        console.log(data)
        return false;
    });*/
});