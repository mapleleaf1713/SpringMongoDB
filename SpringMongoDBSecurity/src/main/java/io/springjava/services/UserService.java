package io.springjava.services;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.springjava.modal.User;
import io.springjava.repository.UserRepository;

/**
 * @author Saeed Eslami
 *
 */
@Service
//@Transactional
public class UserService {

	@Autowired
	UserRepository userRepository;
	
	public User saveUser(User user) {
		userRepository.save(user);
		return user;
	}
	
	public List<User> getAllUser(){
		List<User> users = new ArrayList<>();
		userRepository.findAll().forEach(users::add);
		return users;
	}
	

//	public void deleteUser(int id) {
//		userRepository.deleteById(id);
//	}
	public void deleteUser(User user) {
		userRepository.delete(user);
	}

	public User findUser(String id) {
		return userRepository.findById(id);
	}
	
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}
	
	public void updateUser(int id, User user) {
		userRepository.save(user);
	}
	
	public User findByUsernameAndPassword(String username, String password) {
		return userRepository.findByUsernameAndPassword(username, password);
		
	}
	
}
