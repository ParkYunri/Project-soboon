<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/mypage.css" type="text/css" />

<script>
	$(function() {
		/*
		//when page loads....
		$('.tab_content').hide() // 모든 콘텐츠를 숨김.
		$('ul.tabs li:first').add("active-tabs").show();//첫번째 탭 활성화
		$('.tab_content:first').show(); //첫번째 탭 콘텐츠 보여줌.

		//On click Event
		$('.tabs>li').click(function() {
			var idx = $('.tabs>li').index(this);
			var activeTab = $(this).attr('id');
			console.log(activeTab);
			console.log('event');
			$('.tabs li').removeClass('active-tabs') // active클래스 사전에 모두 제거
			console.log('event2');
			$(this).addClass('active-tabs')// 선택된 탭에 active클래스 추가함.
			$('.tab_content').hide(); // 모든 탭 콘텐츠를 숨김
			console.log($('.tabs>li'));

			$('.tab_content').eq(idx).fadeIn('linear'); // Fade in the active ID content

			return false;
		});*/
		/*-----------------------------------on load-------------------------------------*/
		ajaxSend_mp(1); 
		/*--------------------------------------tab 클릭시-----------------------------------------*/
		$('.nav-item').click(function(){
			var idx = $(this).index()+1;
			console.log(idx);
			ajaxSend_mp(idx); 
		});
		
		//--------------------내가 쓴 게시글 -----------------------
		// 체크박스 전체선택 ---> 하위 체크박스 체크
		$(document).on('click', "#cbx_chk_mypageAll_mypage", function() {
			if ($("#cbx_chk_mypageAll_mypage").is(":checked"))
				$("input[name=chk_mypage]").prop("checked", true);
			else
				$("input[name=chk_mypage]").prop("checked", false);
		});

		$("input[name=chk_mypage]").click(function() {
			var total = $("input[name=chk_mypage]").length;
			var checked = $("input[name=chk_mypage]:checked").length;

			if (total != checked)
				$("#cbx_chk_mypageAll_mypage").prop("checked", false);
			else
				$("#cbx_chk_mypageAll_mypage").prop("checked", true);
		});
	});//$(documnt).onload
	// ajax로 보내기
	 function ajaxSend_mp(idx) {
		let url = "";
		url = "/mypage";
		
		/*$('#multiDel').click(function(){
			let cnt = 0;
			$(".chk").each(function(i,obj){
				if(obj.checked){
					cnt++;//checkbox가 체크상태일 때...
				}
			});
			if(cnt<=0){
				alert("목록을 선택후 삭제하세요..");
				return false;
			}
			$('#listFrm').submit();
		});*/
		// 선택한 체크박스를 삭제하기 ajax버전
		$
	});
	
	//$(documnt).onload
	// ajax로 보내기
	 function ajaxSend_mp(idx) {
		let url = "";
		url = "/mypage";
		
		console.log('>>>>>0');
		if (idx === 1) {
			url += "/mypost";
			console.log(idx+">>>>>"+url);

		} else if (idx === 2) {
			url += '/mycomment';
			console.log(idx+">>>>>"+url);
;
		} else {
			url += '/myfavorite';
			console.log(idx+">>>>>"+url);
		}
		console.log(url);//mypage/myfavorite
		$.ajax({
			url : url,
			data : 'json',
			success : function(dataArr) {
				if (idx == '1') {
					console.log('>>>>>> cofirm.')
					showMyPost(dataArr);
				} else if (idx == '2') {
					showMyComment(dataArr);
				} else {
					showMyFavorite(dataArr);
				}
				
			},
			error : function(e) {
				alert('데이터 받는 도중에 에러발생!');
				console.log('데이터 받는 도중에 에러!!!');
			}

		});//$.ajax
	}//jaxToss
	
	function showMyPost(dataArr) {
		var str = "";
		/*<ul>
			<li><input type="checkbox" id="cbx_chk_mypageAll_mypage" />전체선택</li>
			<li>&nbsp;</li>
			<li>제목</li>
			<li>작성일</li>
			<li>조회수</li>
		</ul>
		<ul>
			<li><input type="checkbox" name="chk_mypage" /></li>
			<li>11231</li>
			<li>휴지통 공구합니다.</li>
			<li>2022.04.28</li>
			<li>30</li>
		</ul>*/
		
		//헤더
		str += "<ul>";
		str += "<li><input type='checkbox' id='cbx_chk_mypageAll_mypage'/> 전책선택</li>";
		str += "<li>&nbsp;</li>";
		str += "<li>제목</li>";
		str += "<li>내용</li>";
		str += "<li>조회수</li>";
		str += "<li>작성일</li>";
		str += "</ul>";
		//본문
		$.each(dataArr.plist, function(i, data){
			//db에 가져올 데이터들
			str += "<ul>";
			str += "<li><input type='checkbox' name='chk_mypage' value='"+data.no+"'/></li>";
			str += "<li>"+data.no+"</li>";
			str += "<li>"+data.title+"</li>";
			str += "<li>"+data.content+"</li>";
			str += "<li>"+data.views+"</li>";
			str += "<li>"+data.createdate+"</li>";
			str += "</ul>";
		});
		let onePagePerRecord=10; // 한 페이지당 10명 기준
		let totalCount=Number(dataArr.cnt); //총인원수 integer로 가져옴
		let pageCount=0;
		//페이지수 구하기 pageCount ==> 연산하는 로직 보면서 구하기
		if(totalCount%onePagePerRecord==0) {
			pageCount = totalCount/onePageRecord;
		}else {
			pageCount = totalCount/onePagePerRecord+1;
		}
		pageCount = Math.floor(pageCount);
		console.log(pageCount);
		//페이지 네비게이션 문자열 만들기
		let pageStr = "<br/>";
		pageStr+='<ul class="pagination" id="paging-mp">';
		pageStr+='<li class="page-item disabled"><a class="page-link" id="prevBtn">Prev</a></li>';
		for(var p=1; p <= pageCount; p++){
			pageStr += '<li class="page-item"><a class="page-link"href="javascript:void(0);" onclick="ml('+p+')">' + p + '</a></li>'
		}
		pageStr += '<li class="page-item"><a class="page-link" id="nextBtn">Next</a></li>'
		pageStr +='</ul>';
		console.log(pageStr);
		$('#inTab1').html(str);
		$('.pagingwrap').html(pageStr);	
	}//showPost in sucess in ajax
	function ml(p) {
		console.log(p);
		let url = "/mypage/mypost?currentPage"+p+"&recordPerPage=10"; 
		$.ajax({
			url: url,
			dateType:'json',
			success:function(dataArr){
				showMyPost(dataArr);
			}
		});
	}
</script>

<div id="mypageContainer">
	<!--   사이드 메뉴 (include) -->
	<%@ include file="/WEB-INF/views/inc/mypageSideBar.jsp"%>

	<!--  view -->
	<div style="width: 75%; height: 100%;" class="viewPage-mypage">
		<h3>내가 쓴 글보기</h3>
		<hr/>
		<br/>
		<div class="topMemu-mypageView" style="width: 100%; height: 150px">
			<div style="width: 20%;" id="image-mypage">
				<i class="bi bi-person-circle"
					style="font-size: 100px; color: gray; padding-top: 10px;"></i>
			</div>
			<div style="width: 30%; height: 100%" id="info-topMenu">
				<div>
					<div>bobyshot</div>
					<div>서울시 도봉구</div>
					<div>kgh4464@naver.com</div>
				</div>
			</div>
			<div id="postPoint" style="width: 50%; height: 100%;">
				<div>
					<div>
						<div>작성글</div>
						<div>${mpCnt }</div>
					</div>
				</div>
				<div>
					<div>
						<div>댓글</div>
						<div>${mrCnt }</div>
					</div>
				</div>
				<div>
					<div>
						<div>찜한글</div>
						<div>3</div>
					</div>
				</div>
			</div>
		</div>
		<!-- topMenu-mypageView -->
		<!-- <div class="listMenuTab"> -->
		<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
		<!-- 탭메뉴 영역 -->
		<ul class="tabs nav nav-tabs">
			<li id="t1" class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#tab1">작성글</a></li>
			<li id="t2" class="nav-item"><a class="nav-link"
				data-toggle="tab" href="#tab2">댓글</a></li>
			<li id="t3" class="nav-item"><a class="nav-link"
				data-toggle="tab" href="#tab3">찜한글</a></li>
		</ul>
		<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
		<div class="tab-content">
			<!-- Content -->
			<div id="tab1" class="tab-pane fade show active">
				<div class="innerTab">
					<h1>tab1</h1>
					<!-- 페이징 목록 -->
					<div id="inTab1"></div>
					<div class="pagingwrap">
						
					</div>
					<div><button id="delPost">삭제하기</button></div>
				</div><!-- innerTab -->
			</div>
			<!-- tab1 -->
			<div id="tab2" class="tab-pane fade">
				<h1>TAB2</h1>
				<div class="innerTab"></div>
			</div>
			<!-- tab2 -->
			<div id="tab3" class="tab-pane fade">
				<div class="innerTab">
					<h1>TAB3</h1>
					내용내용내용내용내용
				</div>
			</div>
			<!-- tab3 -->
		</div>
		<!-- resultView-mypageView" -->
	</div>
	<!-- viewpage-mypage  -->
</div>
<!-- container -->
