package io.springjava.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import io.springjava.modal.User;
import io.springjava.services.UserService;

/**
 * @author Saeed Eslami
 *
 */
@Controller
public class ApplicationController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}
	
	@RequestMapping("/welcome")
	public String Welcome(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "welcomepage";
	}

	@RequestMapping("/register")
	public String registration() {
		return "register";
	}

	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
		if(user.getUsername().startsWith("A0") 
				&& user.getUsername().length() == 9
				&& userService.findByUsername(user.getUsername()) == null ) {
			userService.saveUser(user);
			request.setAttribute("mode", "MODE_HOME");
			return "welcomepage";
		}else {
			request.setAttribute("error", "Username " + user.getUsername() +" is not correct");
			//request.setAttribute("mode", "MODE_REGISTER");
			return "register";
		}
			
		
	}

	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		//request.getPathInfo()
		System.out.println("SIZE: "+userService.getAllUser().size());
		System.out.println(userService.getAllUser().get(0));
		boolean role = request.isUserInRole("ADMIN");
		request.setAttribute("role", role);
		request.setAttribute("users", userService.getAllUser());
		request.setAttribute("people", userService.getAllUser());
		return "showUsers";
	}

	@RequestMapping("/delete-user")
	public String deleteUser(@ModelAttribute User user, HttpServletRequest request) {
		userService.deleteUser(user);
		boolean role = request.isUserInRole("ADMIN");
		request.setAttribute("role", role);
		request.setAttribute("users", userService.getAllUser());
		request.setAttribute("people", userService.getAllUser());
		//request.setAttribute("mode", "ALL_USERS");
		return "showUsers";
	}
	
	@RequestMapping("/update-user")
	public String updateUser(@RequestParam String id, @ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {

		if(user.getUsername().startsWith("A0") 
				&& user.getUsername().length() == 9
				&& userService.findByUsername(user.getUsername()) != null ) {
			userService.saveUser(user);
			request.setAttribute("mode", "MODE_HOME");
			return "welcomepage";
		}else {
			request.setAttribute("error", "Username " + user.getUsername() +" is not correct");
			//request.setAttribute("mode", "MODE_REGISTER");
			return "updateUser";
		}
		
		//		userService.saveUser(user);
//		boolean role = request.isUserInRole("ADMIN");
//		request.setAttribute("role", role);
//		User userlogin = userService.findUser(id);
//		request.setAttribute("userlogin", "The User " + userlogin.getFirstname() + " " +userlogin.getLastname()+" Changed. ");
//		request.setAttribute("users", userService.getAllUser());
//		request.setAttribute("people", userService.getAllUser());
//		request.setAttribute("error", "Invalid Username");
//		//request.setAttribute("mode", "ALL_USERS");
//		return "showUsers";
		
		
//		if(!userService.findUser(id).getUsername().isEmpty() || userService.findUser(id).getUsername() != null) {
//			if(user.getUsername().startsWith("A0") 
//					&& user.getUsername().length() == 9
//					&& userService.findByUsername(user.getUsername()) == null ) {
//			userService.saveUser(user);
//			User userlogin = userService.findUser(id);
//			request.setAttribute("userlogin", "The User " + userlogin.getFirstname() + " " +userlogin.getLastname()+" Changed. ");
//			request.setAttribute("users", userService.getAllUser());
//			request.setAttribute("error", "");
//			//request.setAttribute("mode", "ALL_USERS");
//			return "showUsers";
//		}
//		else {
//			request.setAttribute("error", "Invalid Username");
//			//request.setAttribute("mode", "ALL_USERS");
//			return "updateUser";
//			
//		}
//		}
//		request.setAttribute("error", "Invalid User Details");
//		return "updateUser";
	}
	
	@RequestMapping("/find-user")
	public String findUser(@RequestParam String id,HttpServletRequest request) {
		System.out.println(id);
		System.out.println(userService.findUser(id));
		request.setAttribute("user", userService.findUser(id));
		//request.setAttribute("mode", "MODE_UPDATE");
		return "updateUser";
	}
	
	@RequestMapping("/signout")
	public String logout(HttpServletRequest request){
		request.setAttribute("success", "You logged out successfully");
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		if(request.isUserInRole("USER") || request.isUserInRole("ADMIN") || request.isUserInRole("")) {
		request.setAttribute("error", "");
		}else {
			request.setAttribute("error", "");
		}
		return "login";
	}
	
	
	@RequestMapping("/signin")
	public String signin(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "welcomepage";
	}
	
	@RequestMapping ("/login-user")
	public String loginUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
		if(userService.findByUsernameAndPassword(user.getUsername(), user.getPassword())!=null) {
			User userlogin = userService.findByUsernameAndPassword(user.getUsername(), user.getPassword());
			request.setAttribute("userlogin", "Welcome " + userlogin.getFirstname() + " " +userlogin.getLastname());
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
		}
		else {
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "welcomepage";
			
		}
	}

}
