package com.test.domain;

public class Record {
    private String date;
    private String userName;
    private Integer score;

    public Record() {
    }

    public Record(String date, String userName, Integer score) {
        this.date = date;
        this.userName = userName;
        this.score = score;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Record{" +
                "date='" + date + '\'' +
                ", userName='" + userName + '\'' +
                ", score='" + score + '\'' +
                '}';
    }
}
