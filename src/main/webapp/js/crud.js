function d(CId) {
	var rootpath=$("#rootpath").html();
	alert(rootpath);
	$.ajax({
		type : "POST",
		//contentType : "application/json",
		url : rootpath+"/delete",
		data : {"CId":CId},
		//dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("SUCCESS: ", data);
			var data1=eval(data);
			//var json = JSON.stringify(data, null, 4);
			console.log(data1.code);
			//var res=eval(json);
			//$("#ajax").html(JSON.stringify(data.result[0].CId));
			var append;
			$.each(data.result,function(index,value){
				append+="<tr>";
				append+="<td>"+value.CId+"</td>";
				append+="<td>"+value.user.id+"</td>";
				append+="<td>"+value.postId+"</td>";
				append+="<td>"+value.CText+"</td>";
				append+="<td>"+value.CTime+"</td>";
				append+="<td>"+value.UTime+"</td>";
				append+="<td><a href='#'><span class='glyphicon glyphicon-pencil'></span></a></td>";
				append+="<td><a href='javascript:;' onclick='d("+value.CId+");'><span class='glyphicon glyphicon-remove'></span></a></td>";
				append+="</tr>";
			});
			$(".ajax").html(append);
		}
	});
}