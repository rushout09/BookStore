package com.example.rushabh.BookStore.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.rushabh.BookStore.model.Book;
import com.example.rushabh.BookStore.repository.BookRepository;

@Service
public class BookService {
	
	@Autowired
	BookRepository<Book> bookRepository;
	
	@Transactional
	public List<Book> getAllBooks(){
		return (List<Book>)bookRepository.findAll();
	}
	
	@Transactional
	public List<Book> findByName(String name){
		return (List<Book>)bookRepository.findByName(name);
	}
	
	@Transactional
	public Book getById(Long id) {
		return bookRepository.findById(id).get();
	}
	
	@Transactional
	public void deleteBook(Long id) {
		bookRepository.deleteById(id);
	}
	
	@Transactional
	public Book addBook(Book book) {
		return bookRepository.save(book);
	}
}
