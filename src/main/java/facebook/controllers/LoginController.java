package facebook.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.ProcessBuilder.Redirect;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import facebook.dao.User;
import facebook.hibernate.*;

@Controller
public class LoginController {
		@RequestMapping(value={"/","/{error}"}, method=RequestMethod.GET)
		public String index( @PathVariable Optional<String> error,Model model,HttpSession session)
		{	if (session.getAttribute("uname")!=null) {
			return "redirect:/profile";
		}
			if (error.isPresent()) {
				//System.out.println("attribute set"+error.get());
				
					model.addAttribute("error", error.get());
				
				
			}
			/*else{
				model.addAttribute("error",2);
			}*/
			return "index";
			
		}
		@RequestMapping(value="/login",method=RequestMethod.POST)
		public String login(HttpSession session,@ModelAttribute User u,HttpServletResponse response)
		{
			response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		    response.setHeader("Pragma","no-cache");
		    response.setDateHeader("Expires", 0);
			//Session s=HibernateUtil.openSession();
			Transaction t=null;
			int u2=0;
			try {
				/*t=s.beginTransaction();
				Query query=s.createQuery("from User");
				List result=query.list();*/
				List result=Getdata.getData("User");
				Iterator i=result.iterator();
				
				while (i.hasNext()) {
					User u1 = (User) i.next();
					if (u1.getEmail().equals(u.getEmail())&&u1.getPassword().equals(u.getPassword())) {
						session.setAttribute("uname", u1.getFirstname());
						session.setAttribute("uid", u1.getId());
						u2=1;
						
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				t.rollback();
			}
			
			if (u2==0) {
				return "redirect:/1";
			}
			else{
				return "redirect:/profile";
			}
		}
		@RequestMapping(value="/signup",method=RequestMethod.GET)
		public String signup(HttpSession session)
		{
			if (session.getAttribute("uname")==null) {
				return "signup";
			}
			else {
				return "redirect:/profile";
			}
						
		}
		@RequestMapping(value="/signup",method=RequestMethod.POST)
		public String signup(HttpSession session,@ModelAttribute User u,@RequestParam(value="file") MultipartFile file,HttpServletResponse response)
		{	Getdata.save(u);
			/*Session s=HibernateUtil.openSession();
			Transaction t=null;
			try {
				t=s.beginTransaction();
				s.save(u);
				t.commit();*/
				if (!file.isEmpty()) {
					try {
						byte[] bytes = file.getBytes();

						// Creating the directory to store file
						String rootPath = System.getProperty("catalina.home");
						File dir = new File("E:\\javapractise\\spring\\facebook\\src\\main\\webapp\\image");
						//System.out.println("E:\\javapractise\\spring\\facebook\\src\\main\\webapp\\image");
						if (!dir.exists())
							dir.mkdirs();
						//System.out.println(dir.getAbsolutePath()+ File.separator + u.getImage());
						// Create the file on server
						File serverFile = new File(dir.getAbsolutePath()
								+ File.separator + u.getImage());
						BufferedOutputStream stream = new BufferedOutputStream(
								new FileOutputStream(serverFile));
						stream.write(bytes);
						stream.close();

						//logger.info("Server File Location="+serverFile.getAbsolutePath());

						//return "You successfully uploaded file=" + name; 
					} catch (Exception e) {
						System.out.println("You failed to upload " + u.getImage() + " => " + e.getMessage());
					}
				} else {
					System.out.println("You failed to upload " + u.getImage()
							+ " because the file was empty."); 
				}
			/*} catch (Exception e) {
				// TODO: handle exception
				t.rollback();
			}
			finally {
				s.close();
			}*/
			return "redirect:/";
			
		}
		@RequestMapping(value="/logout",method=RequestMethod.GET)
		String logout(HttpSession session){
			session.removeAttribute("uname");
			session.removeAttribute("uid");
			return "redirect:/";
			
		}

}
