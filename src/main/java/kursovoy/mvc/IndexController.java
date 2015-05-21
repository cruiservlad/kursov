package kursovoy.mvc;

import kursovoy.jdbc.JDBCUtil;
import kursovoy.model.*;

//import org.apache.tomcat.util.codec.binary.StringUtils;
//import org.springframework.cglib.core.CollectionUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

@Controller
public class IndexController {

    /*@RequestMapping(value = "/userList", method = RequestMethod.GET)
    public String get(Model model) {

        JDBCUtil jdbcUtil = new JDBCUtil();
        List<User> allUsers = jdbcUtil.getAllUsers();
        //Get all usersn
        model.addAttribute("users", allUsers);
        return "users";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String getUser(Model model, @RequestParam(value = "userId", required = false) final String userId) {
        User u = new User();
        if (userId != null) {
            JDBCUtil jdbcUtil = new JDBCUtil();
            List<User> allUsers = jdbcUtil.getUser(userId);
            if (!org.springframework.util.CollectionUtils.isEmpty(allUsers))
                u = allUsers.get(0);
        }
        model.addAttribute("user", u);
        return "user";
    }

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public
    @ResponseBody
    String save(final HttpServletRequest request,
                final HttpServletResponse response, final @RequestBody User u) {
        System.out.println(u);
        return "User Saved!";
    }*/
	
		
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String getPage(Model model, final HttpServletRequest request, @RequestParam(value = "page", required = false) final String page)
	{ 
		
		
		if("auth".equals(page)) {
			model.addAttribute("page_auth",true);
		}
		else if("register".equals(page)) {
			model.addAttribute("page_reg",true);
		}
		else if("unlogin".equals(page)) {
			HttpSession session = request.getSession(true);
			session.removeAttribute("Login");
			model.addAttribute("page_unlogin",true);
		}
		else if("post_create".equals(page)) {
			model.addAttribute("page_posting",true);
		}
		else {
			JDBCUtil jdbcUtil = new JDBCUtil();
			List<Post> allPost =jdbcUtil.getAllPost();
			model.addAttribute("posts", allPost);
		}
		
		/*String userId = request.getParameter("MyUserId");	
		//not authorized
		if (userId ==null ){
			
			
			return "login";
		}else {
			//normal mode for aut users
		}
		JDBCUtil jdbcUtil = new JDBCUtil();
        List<User> allUsers = jdbcUtil.getAllUsers();
        //Get all usersn
        model.addAttribute("head", page);
        model.addAttribute("postList", allUsers );*/
		
        return "head";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String updatePage(Model model, final HttpServletRequest request, @RequestParam(value = "page", required = false) final String page)
	{ 
		if("auth".equals(page)) {
			model.addAttribute("page_auth",true);
			String userEmail = request.getParameter("login");
			String userPass = request.getParameter("password");
			JDBCUtil jdbcUtil = new JDBCUtil();
			List<User> allUsers = jdbcUtil.getMyProfile(userEmail, userPass);
			if (org.springframework.util.CollectionUtils.isEmpty(allUsers)) model.addAttribute("Error_Login",true);
			else {
				HttpSession session = request.getSession(true);
				User u = new User();
				u = allUsers.get(0);
				session.setAttribute("IdUser", u.getUserId());
				session.setAttribute("Name_First", u.getFirstName());
				session.setAttribute("Name_Second", u.getLastName());
				session.setAttribute("Login", u.getLogin());
				//System.out.println(u.getLogin());
			}
		}
		
		if("register".equals(page)) {
			model.addAttribute("page_reg",true);
			String userLogin = request.getParameter("login");
			model.addAttribute("login",userLogin);
			String userEmail = request.getParameter("email");
			model.addAttribute("email",userEmail);
			String uName = request.getParameter("FirstName");
			String userPass = request.getParameter("password");
			model.addAttribute("FirstName",uName);
			String uSurName = request.getParameter("SecondName");
			model.addAttribute("SecondName",uSurName);
			String uAge = request.getParameter("Age");
			model.addAttribute("Age",uAge);
			String uGroup = request.getParameter("NameGroup");
			model.addAttribute("NameGroup",uGroup);
			String uUniver = request.getParameter("NameUniversity");
			model.addAttribute("NameUniversity",uUniver);
			String uTextArea = request.getParameter("TextNewsPre");
			model.addAttribute("TextNewsPre",uTextArea);
			JDBCUtil jdbcUtil = new JDBCUtil();
			List<ErrorEmail> allUsers = jdbcUtil.getAllEmail(userEmail);
			if (!org.springframework.util.CollectionUtils.isEmpty(allUsers)) { 
				model.addAttribute("Error_Login",true); model.addAttribute("Error_Login_Email",true); 
				List<ErrorLogin> allLogin = jdbcUtil.getAllLogin(userLogin);
				if (!org.springframework.util.CollectionUtils.isEmpty(allLogin)) model.addAttribute("Error_Login_Login",true);
			}
			else {
				List<ErrorLogin> allLogin = jdbcUtil.getAllLogin(userLogin);
				if (!org.springframework.util.CollectionUtils.isEmpty(allLogin)) { model.addAttribute("Error_Login",true); model.addAttribute("Error_Login_Login",true); }
				else {
					boolean Good = jdbcUtil.RegisterUser(userEmail, userPass, uName, uSurName, uGroup, uUniver, uTextArea, uAge, userLogin);
					if(Good) model.addAttribute("Register_Ok", true); 
					else model.addAttribute("Register_Ok", false);
				}
			}
			
		}
		
		if("post_create".equals(page)) {
			if(request.getParameter("TextNews") == null || request.getParameter("Header") == null) { model.addAttribute("page_posting",true);  model.addAttribute("Error_Post",true); }
			else {
				HttpSession session = request.getSession(true);
	            String login = session.getAttribute("Login").toString();
	            JDBCUtil jdbcUtil = new JDBCUtil();
	            boolean Good = jdbcUtil.NewPost(request.getParameter("TextNews"), request.getParameter("Header"), request.getParameter("publicNews"), login);
	            if(Good) model.addAttribute("Good_Post",true);
	            else { model.addAttribute("page_posting",true);  model.addAttribute("Error_Post",true);}
			}
		}
		
		return "head";
	}
	
	
	/*@RequestMapping(value = "/index?page=auth", method = RequestMethod.POST)
    public
    @ResponseBody
    String save(final HttpServletRequest request,
                final HttpServletResponse response, final @RequestBody User u) {
        System.out.println(u);
        return "User Saved!";
    }*/
}
