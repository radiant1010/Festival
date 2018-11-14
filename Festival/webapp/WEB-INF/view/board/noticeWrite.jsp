<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@media screen and (max-width: 767px) {
   .write_table table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 1px;
      text-align: left;
      line-height: 1.5;
      border-top: 1px solid #ccc;
      margin: 0;
      border-top: 2px solid #606a73;
   }
   .btn_submit {
      background: -webkit-linear-gradient(top, rgba(63, 76, 107, 1) 0%,
         rgba(63, 76, 107, 1) 100%);
      background: linear-gradient(to bottom, rgba(63, 76, 107, 1) 0%,
         rgba(63, 76, 107, 1) 100%);
      width: 200px;
      height: 40px;
      color: #fff;
      border: 1px solid #606a73;
      margin-top: 15px;
   }
}
</style>
<script type="text/javascript">
   function writeBoard() {
      var formData = new FormData();
      var _boardTitle = $("#boardTitle").val();
      var _boardContent = $("#boardContent").val();

      if ("" == _boardTitle) {
         alert("제목을 입력하세요");
         $("#boardTitle").focus();
         return;
      } else if ("" == _boardContent) {
         alert("내용을 입력하세요");
         $("#boardContent").focus();
         return;
      }
      formData.append("boardTitle", $("#boardTitle").val());
      formData.append("boardContent", $("#boardContent").val());
      if ($("input[name=upFile]")[0].files[0] != null) {

         formData.append("upFile", $("input[name=upFile]")[0].files[0]);
      }
      /*  formData.append("upFile", 
            $("input[name=upFile]")[1].files[0]) ; */

      $.ajax({
         url : "/board/noticeWriteAjax.do",
         processData : false,
         contentType : false,
         type : 'POST',
         data : formData,
         success : function(data) {

            alert(data.resultMsg);

            if (data.result == "ok") {
               //화면이동 처리
               var boardNo = data.LbBean;

               location.href = "/board/noticeView.do?boardNo="
                     + boardNo.boardNo;
            }
         }
      }); // end of ajax
   }; // end of function
</script>
</head>
<body>
   <section>
      <div class="sub_wrap">
         <div class="sub_bg">
            <h1>커뮤니티 Community</h1>
            <img src="/images/community.jpg" alt="서브배경" />
         </div>
         <!-- 서브 네비 -->
         <div class="sub_nav">
            <div class="sub_menu">
               <h3>커뮤니티</h3>
               <ul>
                  <li><a href="noticeList.do?pageNo=1" class="on">자유게시판</a></li>
                  <li><a href="qna_list.html"> Q&amp;A </a></li>
               </ul>
            </div>
            <div class="sub_title">
               <div class="rout">
                  <ul>
                     <li>홈</li> >
                     <li>커뮤니티</li> >
                     <li>자유게시판</li>
                  </ul>
               </div>
               <h2>자유게시판 글쓰기</h2>
            </div>

            <!-- 서브 내용 -->
            <div class="sub_content">
               <div class="write_table">
                  <table>
                     <tr>
                        <th>제목</th>
                        <td><input type="text" class="input" id="boardTitle"
                           placeholder="제목을 입력해 주세요" /></td>
                     </tr>
                     <tr>
                        <th>첨부파일</th>
                        <td><input type="file" name="upFile"></td>
                     </tr>
                     <tr>
                        <th>내용</th>
                        <td><textarea id="boardContent"></textarea></td>
                     </tr>
                  </table>
                  <button type="submit" class="btn_submit" onclick="writeBoard()">등록하기</button>
               </div>
            </div>
         </div>
      </div>


   </section>
   <!--메인끝 -->
</body>
</html>