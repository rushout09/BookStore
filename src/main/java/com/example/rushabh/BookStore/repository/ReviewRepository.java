package com.example.rushabh.BookStore.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.rushabh.BookStore.model.Review;

public interface ReviewRepository<R> extends CrudRepository<Review, Long> {

}
