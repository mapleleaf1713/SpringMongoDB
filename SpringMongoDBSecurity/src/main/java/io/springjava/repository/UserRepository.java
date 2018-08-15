package io.springjava.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import io.springjava.modal.User;

/**
 * @author Saeed Eslami
 *
 */
@Repository
public interface UserRepository extends MongoRepository<User, Integer> {
	public User findByUsernameAndPassword(String username, String password);
	public User findById(String id);
	public User findByUsername(String username);
}
