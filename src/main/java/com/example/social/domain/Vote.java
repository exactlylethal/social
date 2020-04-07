package com.example.social.domain;

import javax.persistence.*;


@Entity
public class Vote {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private Long vote_counter;

    @ManyToOne
    @JoinColumn(name="answer_id")
    private Answer answer;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getVote_counter() {
        return vote_counter;
    }

    public void setVote_counter(Long vote_counter) {
        this.vote_counter = vote_counter;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }
}
