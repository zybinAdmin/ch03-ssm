package com.test.service.serviceImpl;

import com.test.dao.QuestionDao;
import com.test.domain.Question;
import com.test.domain.Record;
import com.test.service.QuestionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService {

    @Resource
    private QuestionDao questionDao;


    @Override
    public int questionAdd(Question question) {
        int result = questionDao.questionAdd(question);
        return result;
    }

    @Override
    public List findAllQuestion() {
        List<Question> questions = questionDao.findAllQuestion();
        return questions;
    }


    @Override
    public int deleteQuestion(String questionId) {
        int result = questionDao.deleteQuestion(questionId);
        return result;
    }

    @Override
    public Question findByIdQuestion(Integer questionId) {
        Question questions = questionDao.findByIdQuestion(questionId);
        return questions;
    }

    @Override
    public int upDateQuestion(Question question) {
        int result = questionDao.upDateQuestion(question);
        return result;
    }

    @Override
    public List findRandQuestion() {
        List<Question> questions = questionDao.findRandQuestion();
        return questions;
    }

    @Override
    public Question queryQuestion(String questionId) {
        Question question = questionDao.queryQuestion(questionId);
        return question;
    }

    @Override
    public int examinationRecords(Record record) {
        int result = questionDao.examinationRecords(record);
        return result;
    }

    @Override
    public List<Record> recordAll() {
        List<Record> records = questionDao.recordAll();
        return records;
    }

    @Override
    public List<Record> queries(String userName) {
        List<Record> records = questionDao.queries(userName);
        return records;
    }
}
