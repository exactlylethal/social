package com.example.social.repo;

import com.example.social.domain.Poll;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Poll, Long> {
    List<Poll> findByTag(String tag);
}
