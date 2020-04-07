package com.example.social.repo;

import com.example.social.domain.Answer;
import com.example.social.domain.Vote;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface VoteRepo extends CrudRepository<Vote, Long> {
    List<Vote> findByAnswer(Long answer);

}
