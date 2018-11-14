<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   
   <link href="/css/main_style.css" rel="stylesheet" type="text/css" />
    <link href="/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/css/style_h.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
</head>
<style>
@media screen and (max-width: 767px){
	header{
		display:none;
	}
	.wrapper{
		display:none;
	}
}
</style>
<body>
   <script type="text/javascript">
   
      // 1초마다 채팅창을 갱신해준다.
      setInterval(function() {
         $("#messageTextArea").scrollTop($("#messageTextArea")[0].scrollHeight);
      }, 1000);

      $(function(){
         
         $('#messageText').keypress(function(e) { 
            // 엔터키를 눌렀을때
             if(e.which == 13) { 
                  $(this).blur(); 
                  
                  // textarea에 글씨를 적었으면 실행한다.
                  if ($("#messageText").val() != "") {
                     // 엔터를 누르면 버튼을 클릭한다.
                     $('#button_id').focus().click();
                     // 글이 많아질수록 textarea 포커스를 하단에 위치하게 한다.
                     $("#messageTextArea").scrollTop($("#messageTextArea")[0].scrollHeight);
                  }
                  // 마지막으로 글을 적는 부분에 포커스를 준다
                  $("#messageText").focus();
             } 
         });
      })
   </script>
   
    <div class="form-group">
        <textarea class="form-control" id="messageTextArea" readonly="readonly" rows="10" cols="45" autofocus="autofocus" style="resize: none;"></textarea><br />
    </div>
    
    <div class="col-md-6 col-md-offset-3">
        <div class="form-group">
            <input type="text" class="form-control" id="messageText" />
        </div>
        <button type="button" id="button_id" value="Send" onclick="sendMessage()" class="btn btn-primary btn-block">등록 </button>
        <input type="hidden" id="check_id" name="check_id" value="${sessionScope.memberBean.memberAdmin}" />
        <input type="hidden" id="check_name" name="check_name" value="${sessionScope.memberBean.memberName}" />
    </div>
    
    <script type="text/javascript">
       
        //웹소켓 초기화
//         var webSocket = new WebSocket("ws://localhost:8082/broadsocket");
        var webSocket = new WebSocket("ws://localhost:80/broadsocket");
        var messageTextArea = document.getElementById("messageTextArea");
        
        // 관리자인지, 일반회원인지 구분하기 위해 회원 값을 얻어옴
        var check_id = document.getElementById("check_id"); // 관리자 여부 판단
        var check_name = document.getElementById("check_name"); // 로그인한 회원 이름
//         alert(check_name.value);
        
       //웹 소켓이 연결되었을 때 호출되는 이벤트
        webSocket.onopen = function(message){
            
            if (check_id.value == "Y") {
               messageTextArea.value += "Server connect...\n";
               messageTextArea.value += "[관리자]로 입장하셨습니다.\n";
               
               webSocket.send("[관리자]");
               
            } else {
               messageTextArea.value += "Q&A 채팅방에 들어오셨습니다. 관리자에게 궁금한 사항이 있다면 물어봐 주세요. 채팅을 보는 즉시 답변드립니다.^^\n";
               
               if (check_name.value == null || check_name.value == "") { // 회원이 아닐경우
                  messageTextArea.value += "안녕하세요~ [Guest]님! 무엇을 도와드릴까요? ^^\n";
                  webSocket.send("[Guest]");
               } else { // 회원일 경우
                  messageTextArea.value += "안녕하세요~ [" + check_name.value + "]님! 무엇을 도와드릴까요? ^^\n";
                  webSocket.send("[" + check_name.value + "]");
               }
            }
        };
        //웹 소켓이 닫혔을 때 호출되는 이벤트
        webSocket.onclose = function(message){
            messageTextArea.value += "Server Disconnect...\n";
        };
      // 웹 소켓이 에러가 났을 때 호출되는 이벤트
        webSocket.onerror = function(message){
            messageTextArea.value += "error...\n";
        };
        
        //메시지가 오면 messageTextArea요소에 메시지를 추가한다.
        webSocket.onmessage = function processMessge(message){
            //Json 풀기
            var jsonData = JSON.parse(message.data);
            if(jsonData.message != null) {
                messageTextArea.value += jsonData.message + "\n"
            };
        }
        //메시지 보내기
        function sendMessage(){
            var messageText = document.getElementById("messageText");
            if (messageText.value == null || messageText.value == "") {
               return;
            }
            webSocket.send(messageText.value);
            messageText.value = "";
            
         // 글이 많아질수록 textarea 포커스를 하단에 위치하게 한다.
         $("#messageTextArea").scrollTop($("#messageTextArea")[0].scrollHeight);
        }
         //웹소켓 종료
        function disconnect(){
            webSocket.close();
        }
    </script>
</body>
</html>