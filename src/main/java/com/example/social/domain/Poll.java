package com.example.social.domain;


import org.hibernate.validator.constraints.Length;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Set;

@Entity
public class Poll {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Сообщение не может быть пустым")
    @Length(max = 2048, message = "Слишком длинное сообщение")
    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(columnDefinition = "user_id")
    private User author;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "poll", fetch = FetchType.EAGER, orphanRemoval = true)
    private Set<Answer> answers;

    public Poll() {
    }

    public Poll(User user, String name){
        this.name = name;
        this.author = user;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }
}
