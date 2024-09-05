<%@ page language="java" contentType="text/html; charset=UTF-8"%>
   <!-- 안내 문구 시작 -->
   <p class="info">회원가입 시 입력하신 이름과 질문에 대한 답변을 통해<br>아이디를 확인하실 수 있습니다.</p>
   <!-- 안내 문구 끝 -->

   <br>

   <!-- 아이디 찾기 폼 컨테이너 시작 -->
   <div class="form-container">
       <form>
           <!-- 아이디 찾기 입력 테이블 시작 -->
           <table class="table" style="width: 500px;">
               <tbody>
                   <!-- 이름 입력 필드 시작 -->
                   <tr>
                       <td>이름</td>
                       <td><input type="text" class="form-control input-small" name="name" required></td>
                   </tr>
                   <!-- 이름 입력 필드 끝 -->

                   <!-- 질문 선택 필드 시작 -->
                   <tr>
                       <td>질문</td>
                       <td>
                           <select class="form-control input-small" name="question" required>
                               <option>가장 좋아하는 색깔은?</option>
                               <option>가장 좋아하는 동물은?</option>
                               <option>내가 다녔던 초등학교는?</option>
                               <option>어렸을때의 별명은?</option>
                               <option>현재 거주하고 있는 주소는?</option>
                           </select>
                       </td>
                   </tr>
                   <!-- 질문 선택 필드 끝 -->

                   <!-- 답변 입력 필드 시작 -->
                   <tr>
                       <td>답변</td>
                       <td><input type="text" class="form-control input-small" name="answer" required></td>
                   </tr>
                   <!-- 답변 입력 필드 끝 -->
               </tbody>
           </table>
           <!-- 아이디 찾기 입력 테이블 끝 -->

           <!-- 확인 버튼 시작 -->
           <a id="id-search-complete" class="btn btn-dark" href="${pageContext.request.contextPath}/member/memberIdSearchComplete" >확인</a>
           <!-- 확인 버튼 끝 -->
           
           <br>
       </form>
   </div>
