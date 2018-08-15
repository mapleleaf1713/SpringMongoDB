//package io.springjava.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import io.springjava.modal.User;
//import io.springjava.services.UserService;
//
//@org.springframework.web.bind.annotation.RestController
//public class RestController {
//
//	@Autowired
//	UserService userService;
//
////	@RequestMapping("/")
////	public String home(HttpServletRequest request) {
////		request.setAttribute("mode", "MODE_HOME");
////		return "welcomepage";
////	}
//
//	@GetMapping("/adduser")
//	public String saveUser(@RequestParam String username, @RequestParam String firstname, @RequestParam String lastname,
//			@RequestParam int age, @RequestParam String password) {
//		User user = new User(username,firstname,lastname,age,password);
//		userService.saveUser(user);
//		return "User Saved";
//	}
//	
//	@GetMapping(path="/showusers")
//	public @ResponseBody List<User> getAllUser(){
//		return userService.getAllUser();
//	}
//}
