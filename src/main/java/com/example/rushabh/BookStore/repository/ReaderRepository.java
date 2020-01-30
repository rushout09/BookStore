package com.example.rushabh.BookStore.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.rushabh.BookStore.model.Reader;

public interface ReaderRepository<R> extends CrudRepository<Reader, Long> {
	List<Reader> findByFirstName(String fistName);
	List<Reader> findByLastName(String lastName);

}
