package com.example.social.domain;


import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Set;


@Entity
public class Answer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Сообщение не может быть пустым")
    @Length(max = 2048, message = "Слишком длинное сообщение")
    private String text;

    @Length(max = 255, message = "Слишком длинное сообщение")
    private String tag;

    @ManyToOne
    @JoinColumn(columnDefinition = "user_id")
    private User author;

    @ManyToOne
    @JoinColumn(name="poll_id")
    private Poll poll;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "answer", fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<Vote> votes;

    private String filename;



    public Answer(){
    }

    public Answer(String text, String tag, User user) {
        this.author = user;
        this.text = text;
        this.tag = tag;
    }


    public String getAuthorName(){
        return author != null ? author.getUsername() : "<none>";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Poll getPoll() {
        return poll;
    }

    public void setPoll(Poll poll) {
        this.poll = poll;
    }

}
