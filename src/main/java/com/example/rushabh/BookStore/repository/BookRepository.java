package com.example.rushabh.BookStore.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.rushabh.BookStore.model.Book;

public interface BookRepository<B> extends CrudRepository<Book, Long> {
	List<Book> findByName(String name);
}
