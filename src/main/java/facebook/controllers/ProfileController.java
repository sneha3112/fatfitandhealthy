package facebook.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import facebook.dao.Comment;
import facebook.dao.User;
import facebook.hibernate.Getdata;
@Controller
public class ProfileController {
	@RequestMapping(value="/profile",method=RequestMethod.GET)
	public String profile(HttpSession session,HttpServletResponse response,Model m)
	{
		if (session.getAttribute("uname")!=null) {
			Iterator i=Getdata.onecolumnvaluewhere("User", "id", Integer.toString((Integer) session.getAttribute("uid"))).iterator();
			System.out.println(i);
			
			m.addAttribute("user",(User)i.next());
			return "profile";
		}
		else{
		return "redirect:/mustlogin";
		}
	}
	@RequestMapping(value="/crud",method=RequestMethod.GET)
	public ModelAndView crud(HttpSession session)
	{
		List<Comment> l=Getdata.getData("Comment");
		
		return new ModelAndView("crud", "comment", l);
		
	}
	@RequestMapping(value="/edit/{CId}",method=RequestMethod.GET)
	public String edit(HttpSession s,Model m,@PathVariable int CId)
	{
		Iterator<Comment> i=Getdata.onecolumnvaluewhere("Comment", "CId", String.valueOf(CId)).iterator();
		m.addAttribute("Comment", (Comment)i.next());
		return "edit";
		
	}
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edit(HttpSession session,@ModelAttribute Comment comment)
	{
		comment.setUTime(new SimpleDateFormat("E MMM dd yyyy HH:mm:ss").format(new Date()));
		Getdata.update(comment);
		return "redirect:/crud";
	}
	
}
