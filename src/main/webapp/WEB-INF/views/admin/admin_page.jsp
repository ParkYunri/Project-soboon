<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/admin.css" type="text/css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/js/admin.js"></script>
	<div class="admincontainer">
		<div class="row">
			<div class="col">
				<ul class="nav nav-tabs" id="tab">
					<li class="nav-item" id='tab1'><a class="nav-link active"	data-toggle="tab" href="#memberMgr">회원관리</a></li>
					<li class="nav-item" id='tab2'><a class="nav-link" data-toggle="tab" href="#reportMgr" >신고관리</a></li>
					<li class="nav-item" id='tab3'><a class="nav-link" data-toggle="tab" href="#listupMgr" id='tab3'>게시글 현황</a></li>
				</ul>
				
				<div class="tab-content">
					<br />
					<div class="tab-pane fade show active" id="memberMgr">
						<div style="float: left" id="membercnt"></div>
						<br />
						<!-- 회원관리 -->
						<ul class="memberList">
						<!--
						<li><input type="checkbox" id="checkAll"></li>
							<li>아이디</li>
							<li>경고횟수</li>
							<li>이름</li>
							<li>닉네임</li>
							<li>전화번호</li>
							<li>이메일</li>
							<li>주소</li>
							-->
							
						</ul>
					</div> 
					
					<div class="tab-pane fade" id="reportMgr">
						<!-- 신고관리 -->
						<ul class="reportList">
							<!-- <li><input type="checkbox" id="checkAll"></li>
							<li>아이디</li>
							<li>누적신고</li>
							<li>신고내용</li>
							<li>신고처리</li> -->
						</ul>
					</div>
						<!-- 게시글 현황 -->
					<div class="tab-pane fade" id="listupMgr">
						<ul class="listupList">
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"	data-toggle="tab" href="#days">일일</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#months">주간</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#months">월</a></li>
							</ul>
						</ul>
					</div>
					<!-- 	탈퇴내역
					<div class="tab-pane fade" id="resignMgr">
						<ul class="resignList">
							<li>아이디</li>
							<li>탈퇴사유</li>
							<li>탈퇴일자</li>
						</ul>
					</div> -->
				</div>
			</div>
		</div>
		<div id="page">
				page
		</div>
	</div>
