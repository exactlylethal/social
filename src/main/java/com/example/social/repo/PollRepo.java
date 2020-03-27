package com.example.social.repo;


import com.example.social.domain.Poll;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PollRepo extends CrudRepository<Poll, Long> {
    List<Poll> findByName(String tag);

}