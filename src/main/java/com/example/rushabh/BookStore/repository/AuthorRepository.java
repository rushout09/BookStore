package com.example.rushabh.BookStore.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.rushabh.BookStore.model.Author;

public interface AuthorRepository<A> extends CrudRepository<Author, Long> {
	List<Author> findByFirstName(String fistName);
	List<Author> findByLastName(String lastName);
}
