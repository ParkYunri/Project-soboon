<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/shareBoardWrite.css" type="text/css"/>
<script src="/js/shareBoardWrite.js"></script>
<script src="/js/boardaddrDialog.js"></script>
<div class="container">
	<br/>
	<form class="form-group" method="post" action="/board/shareBoardWriteOk?category=share" id="shareReqForm" enctype="multipart/form-data">
		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			<thead>
				<tr>
					<th><h1 style="text-align:center;">나눔 게시판 글 작성하기</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div>
							<select id="boardlargeAddrSelect" name="large" default="${addrLarge}"></select>
							<select id="boardmediumAddrSelect" name="medium" default="${addrMedium}"></select>
							<select id="boardsmallAddrSelect" name="small" default="${addrSmall}"></select>
						</div>
					</td>
				</tr>
				<tr>
					<td id="tbBody">
						<input type="text" class="form-control" id="shareBoardTitle" placeholder="글 제목을 입력하세요."  name="title" maxlength="16"/>
					</td>
				</tr>
				<tr>
					<td><textarea name="content" id="writeContent" placeholder="글 내용을 입력하세요."></textarea></td>
				</tr>
			</tbody>
		</table>
		<div id="fileList">
			<button type="button" class="btn" id="uploadBtn">첨부파일 선택</button>
			<div id="innerFiles">
     			<input type="file" name="fileImg" id="img1"/>
     			<input type="file" name="fileImg" id="img2"/>
     			<input type="file" name="fileImg" id="img3"/>
     			<input type="file" name="fileImg" id="img4"/>
  			</div>
  		</div>
  		<div class="col-12 text-center">
			<input type="submit" class="btn" id="writeBtn" value="등록"/>
			<input type="reset" id="resetBtn" class="btn" value="취소"/>
		</div>
	</form>
</div>
<br/>