<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	input[type='submit']{ 
		background-color: black;
		color:white;   
	}
</style>     
</head>
<body> 
	
	<form action="upload.do" method="post" enctype="multipart/form-data">
	<div id="container">  
		<input type="file" name="picture" multiple="multiple" id="imgInp"><br>
		<div class="imgs_wrap"> 
		</div> 
		<br><br><br><br><br>
		<input type="submit" value="등록하기">
	</div>
	</form>
</body>
<script type="text/javascript">
	var sel_files = []; // 이미지 정보들을 담을 배열
	                           
	$("#imgInp").on("change", handleImgsFilesSelect);
	                
	function handleImgsFilesSelect(e){
		//이미지 정보들을 초기화
		sel_files = []; 
		$(".imgs_wrap").empty();
		
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var index = 0;
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var img_html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\""+e.target.result+"\" data-file='"+f.name+"' class='selProductFile'/></a>";;
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
		})
	}
	
	function deleteImageAction(index){
		sel_files.splice(index,1);
		
		var img_id = "#img_id_"+index;
		$(img_id).remove();
	}

</script>
</html>


