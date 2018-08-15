package io.springjava;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import io.springjava.controller.ApplicationController;
import io.springjava.modal.User;
import io.springjava.services.UserService;

@RunWith(SpringRunner.class)
@WebMvcTest(value = ApplicationController.class, secure = false)
public class UserControllerTest {

	@Autowired
	private MockMvc mockMvc;
	
	@MockBean
	private UserService userService;

	
	
	@Test
	public void testHome() {
		//fail("Not yet implemented");
	}

	@Test
	public void testWelcome() {
		//fail("Not yet implemented");
	}

	@Test
	public void testRegistration() {
		//fail("Not yet implemented");
	}

	@Test
	public void testRegisterUser() {

		User mockUser = new User();
		
		mockUser.setUsername("A01111111");
		mockUser.setFirstname("Test");
		mockUser.setLastname("Test");
		mockUser.setAge(1);
		mockUser.setPassword("test");
		
		String url = "/save-user";
		
		Mockito.when(userService.saveUser(Mockito.any(User.class))).thenReturn(mockUser);
		
		
	}

	@Test
	public void testShowAllUsers() {
		//fail("Not yet implemented");
	}

	@Test
	public void testDeleteUser() {
		//fail("Not yet implemented");
	}

	@Test
	public void testUpdateUser() {
		//fail("Not yet implemented");
	}

	@Test
	public void testFindUser() {
		//fail("Not yet implemented");
	}

	@Test
	public void testLogout() {
		//fail("Not yet implemented");
	}

	@Test
	public void testLogin() {
		//fail("Not yet implemented");
	}

	@Test
	public void testSignin() {
		//fail("Not yet implemented");
	}

	@Test
	public void testLoginUser() {
		//fail("Not yet implemented");
	}


}
