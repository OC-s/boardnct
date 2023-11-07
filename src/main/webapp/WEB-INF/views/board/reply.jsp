<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.replytable {
	border-bottom: 2px dotted #eeeeee !important;
}
</style>
<script>
	var bno = '${detaildto.bno}';
	var usermno = '${dto.mno}';
	var userrole = '${dto.role}';

	console.log("bno" + bno);
	console.log("usermno" + usermno);
	console.log("userrole" + userrole);
	// 댓글 리스트
	function commentList() {
		$.ajax({
			url : '/reply/list',
			type : 'get',
			data : {
				'bno' : bno
			},
			success : function(response) {
				console.log("ajax success");
				var a = '';
	
				$.each(
					response,
					function(key, value) {
						a += '<div class="commentArea align-itmes-center mb-0 margin-bottom: 15px;">';
						a += '<table class="replytable"><colgroup><col width="5%" /><col width="15%"/><col width="50%"/><col width="100%"/></colgroup>';
						a += '<tr><td><span class="material-icons">account_circle</span></td><td> <div class="d-flex flex-column px-6 py-6">';
						a += '<span class="commentInfo'+value.reno+'"><h6 class="mb-0 text-sm">' + value.nickname + '</h6></span>';
						a += '<span class="commentRedate'+value.redate+'"><p class="text-xs text-secondary mb-0">' + value.redate + '</p></span>';
						a += '</div> </td><td class="">';
						a += '<span class="commentContent'+value.reno+'"><span class="text-dark text-sm">'+ value.recontents + '</span></span>';
						a += '<span class="updateReplyOk'+value.reno+'"></span></td><td class="align-middle'+value.reno+'">';

						/* 수정 */
						if (usermno == value.mno) {
							a += '<a href="javascript:;" class="text-secondary font-weight-bold text-xs updatebtns'
									+ value.reno + '" onclick="replyUpdate(' + value.reno + ',\'' + value.recontents + '\');">';
							a += '수정 | </a>';
						}

						/* 삭제 */
						if (userrole == "ROLE_ADMIN" || usermno == value.mno) {
							a += '<a href="javascript:;" class="text-secondary  font-weight-bold text-xs updatebtns'
									+ value.reno + '" onclick="replyDelete('+ value.reno + ');">';
							a += '삭제</a>';
						}

						a += '</td></tr> </table>';
						a += '</div>';

					});
				$(".commentList").empty();
				$(".commentList").append(a);
			},
			error : function() {
				console.log("실패")
			}
		});
	}

	$(document).ready(function() {
		commentList(); // 페이지로딩시 댓글 목록 출력
		console.log("게시물번호 : " + bno);
	})

	// ---------------------------------------------------------------------------

	// 댓글 등록
	function writeReply(x) {

		var recontents = x.form[2].value;
		console.log("텍스트 : " + recontents);

		if (recontents == '') {
			alert("내용을 입력하세요.");
			x.form[2].focus();
			return;
		}

		var params = $("#replyform").serialize(); //serialize() :  commentInsertForm 내용 가져옴
		console.log("commentInserForm 내용 : " + params);

		$.ajax({
			url : "/reply/insert",
			type : "post",
			data : params,
			success : function(data) {
				commentList(); // 댓글 작성후 목록 reload
				$('#recontents').val('');
			},
			error : function(data) {
				alert("댓글 등록 실패");
			}
		});
	};

	// ---------------------------------------------------------------------------

	// 댓글 수정
	function replyUpdate(reno, recontents) {
		var a = '';
		var b = '';
		$('.updatebtns' + reno).hide(); //수정, 삭제버튼
		$('.commentContent' + reno).hide(); //내용 숨기기

		a += '<div class="input-group">';
		a += '<input type="text" class="form-control toggleinput" name="recontents_'+reno+'" value ="'+recontents+'"/></div>';

		b += '<span class="input-group-btn">';
		b += '<a href="javascript:;" class="text-secondary font-weight-bold text-xs" onclick="replyUpdateOk('+ reno
				+ ');">확인 | </a><a href="javascript:;" class="text-secondary font-weight-bold text-xs" onclick="reset('
				+ reno + ')">취소</a> </span>';

		$('.updateReplyOk' + reno).append(a);
		$('.align-middle' + reno).append(b);

	}

	function reset(reno) {
		$('.commentContent' + reno).show(); // 내용보이기
		$('.updatebtns' + reno).show(); //수정,삭제버튼 보이기
		$('.toggleinput').hide(); //수정칸 숨기기
		$('.input-group-btn').hide(); //수정 취소버튼 숨기기
	}

	function replyUpdateOk(reno) {
		var updateRecontents = $('[name=recontents_' + reno + ']').val();
		console.log("ttttttttttt : " + updateRecontents);
		$.ajax({
			url : '/reply/modifyOk',
			type : 'post',
			data : {
				'recontents' : updateRecontents,
				'reno' : reno
			},
			success : function(data) {
				commentList();

			}
		});
	}

	// ---------------------------------------------------------------------------

	// 댓글 삭제
	function replyDelete(reno) {
		if (confirm("댓글을 삭제하시겠습니까?") == true) {
			$.ajax({
				url : '/reply/delete/' + reno,
				type : 'post',
				success : function(data) {
					commentList();
				}
			});
		} else {
			return;
		}
	}
	// ---------------------------------------------------------------------------
	
	// input 엔터 - form 태그에 submission 발생하면서 오류뜸 - 해결방안 
	$(document).ready(function(e) {
		$("input").keydown(function(event) {
			if(event.keyCode === 13){
				event.preventDefault(); // 엔터 이벤트 발생 취소
			}
		})
	})
	
</script>

<div class="row 9-5">
	<div class="row">
	<form name="commentInsertForm" id="replyform" method="post">
		<input type="hidden" name="bno" value="${detaildto.bno}" /> <input
			type="hidden" name="mno" value="${dto.mno }" />
		<div class="col-md-9 col-lg-8">
			<label for="articleComment" hidden>댓글</label> 
			<input class="form-control" id="recontents" name="recontents" placeholder="댓글 쓰기.." rows="3" required />
		</div>
		<div class="col-md-3 col-lg-3">
			<label for="comment-submit" hidden>댓글 쓰기</label>
			<button class="btn btn-primary" id="insertBtn" type="button" onclick="writeReply(this);">쓰기</button>
		</div>
	</form>
	</div>
</div>

<div class="container">
	<div class="commentList"></div>
</div>

