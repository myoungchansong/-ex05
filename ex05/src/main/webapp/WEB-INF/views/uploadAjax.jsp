<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Upload with Ajax</h1>
	
	<div class='uploadDiv'>

		<input type='file' name='uploadFile' multiple>
		
	</div>

	<button id='uploadBtn'>Upload</button>

	<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
	<script>
	
		
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("사이즈 초과");
			
			return false;
		}
		
		if(regex.test(fileName)) {
			
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
			
		}
		
		return true;
		
		
		
	}
	
			$("#uploadBtn").on("click", function(e){
				
				var formData = new FormData();
				/* FormData 가상의 form태그와 같다고 생각 하면됨 */
				var inputFile = $("input[name='uploadFile']");
				
				var files = inputFile[0].files;
				
				console.log(files);
				
				//add fileadate to formdata
				for(var i = 0; i<files.length; i++){
					
					if(!checkExtension(files[i].name, files[i].size) ){
						return false;
					}
					
					
					formData.append("uploadFile", files[i]);
					
				}
				
				
				$.ajax({

					url: '/uploadAjaxAction',
					processData: false,
					contentType: false,
					//processData, contentType 반드시 false여야만 데이터 전송이 됨
					data: formData,
					type: 'POST',
					success: function(result){
						alert("Uploaded");
					}
				}); //end ajax
				
			});
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	</script>
		
	


</body>
</html>