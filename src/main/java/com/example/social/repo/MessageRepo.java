package com.example.social.repo;

import com.example.social.domain.Answer;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface MessageRepo extends CrudRepository<Answer, Long> {
    List<Answer> findByTag(String tag);
    List<Answer> findByAuthorIdAndPollId(Long author_id, Long poll_id);
}
