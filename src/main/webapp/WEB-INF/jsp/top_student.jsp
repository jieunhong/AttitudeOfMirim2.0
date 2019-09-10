<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function logout(){
	var result = confirm("로그아웃 하시겠습니까?");
	if (result == true){
		location.href="/";
	}
}
function changePwd(){
    $('#popup').bPopup();
}

var closePopup = function(){
    $('#popup').bPopup().close();
}

console.log("© Copyright NEWMEDIA CONTENTS MIRIM MEISTER SCHOOL , Jieun Hong 2018. ALL RIGHTS RESERVED");
console.log("페이지에 관한 문의사항은 hyy0786@e-mirim.hs.kr으로 연락 부탁드립니다.");
</script>
<div class="top">
	<a href="/student/main">
		<i class="fa fa-user-circle-o" aria-hidden="true"></i>
		<div class="title">Attitude of Mirim - student</div>
	</a>
	<a class="logout" onclick="logout();">
    Logout
	</a>
  <a class="logout" onclick="changePwd()">
    Change Password
  </a>
    <hr noshade  style="margin-right:10px;margin-left:10px;"/>
  </div>

<aside>
    <div id="popup" class="popup">
        <a class='popup-delete' onclick="closePopup()">
            <img class="close-button" src="/resources/img/icon_close.png">
        </a>
        <center>
            <div id="popupContents" class="popup_contents">
                <ul>
                    <li class="change_pwd_list">
                        <ul>
                            <li>현재 비밀번호</li>
                            <li><input type="text" id="currentPwd"> </li>
                        </ul>
                    </li>
                    <li class="change_pwd_list">
                        <ul>
                            <li>변경할 비밀번호</li>
                            <li><input type="text" id="changePwd"> </li>
                        </ul>
                    </li>
                    <li class="change_pwd_list">
                        <ul>
                            <li>변경할 비밀번호 확인</li>
                            <li><input type="text" id="changePwdChk"> </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </center>
    </div>
</aside>
