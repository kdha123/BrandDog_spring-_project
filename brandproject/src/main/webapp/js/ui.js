/**
 * 입력 js
 * default_decorator.jsp 파일에 추가해서 사용한다.
 * 
 */
// datepicker 처리함수.
function datepicker(obj){
//	alert("datepicker().obj:" + obj);
	// 생년월일 날짜 캘랜더 사용
    $(obj).datepicker({changeMonth:true, changeYear:true,
    	monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","01월","11월","12월"],
    	dayNamesMin:["일","월","화","수","목","금","토"],	
    	dateFormat: "yy-mm-dd"
    });

}

$(function(){
	
// 취소 버튼 처리 -> 이전페이지
	$(".backBtn, .cancelBtn").click(function(){
//		alert("취소");
		history.back();
	});
	
});
