package com.example.rushabh.BookStore.controller;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.example.rushabh.BookStore.model.Book;
import com.example.rushabh.BookStore.service.BookService;

@RestController
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@GetMapping("/books")
	public List<Book> getAll(){
		return bookService.getAllBooks();
	}
	
	@GetMapping("/books/id/{id}")
	public Book getById(@PathVariable Long id) {
		return bookService.getById(id);
	}
	
	@GetMapping("/books/name/{name}")
	public List<Book> getByName(@PathVariable String name) {
		return bookService.findByName(name);
	}
	
	@PostMapping("/books")
	public ResponseEntity createBook(@RequestBody Book book) {
		Book savedBook = bookService.addBook(book);
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/id/{id}").buildAndExpand(savedBook.getId()).toUri();
		
		return ResponseEntity.created(location).build();
	}
	
	@DeleteMapping("/books/id/{id}")
	public void deleteBook(@PathVariable Long id) {
		bookService.deleteBook(id);
	}
	
	
	
	
}
