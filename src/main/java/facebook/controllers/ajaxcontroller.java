package facebook.controllers;

import java.util.List;




import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import facebook.dao.AjaxResponseBody;
import facebook.dao.Comment;
import facebook.hibernate.Getdata;
import facebook.jsonview.Views;


@RestController
public class ajaxcontroller {
	@JsonView(Views.Public.class)
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public AjaxResponseBody delete(@RequestParam int CId)
	{
		Getdata.delete("Comment", "CId", CId);
		List<Comment> comments=Getdata.getData("Comment");
		AjaxResponseBody result=new AjaxResponseBody();
		result.setCode("200");
		result.setMsg("");
		result.setResult(comments);
		return result;
	}
}
