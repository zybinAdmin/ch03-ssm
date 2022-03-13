package com.test.dao;

import com.test.domain.Question;
import com.test.domain.Record;

import java.util.List;

public interface QuestionDao{

    //试题添加
    int questionAdd(Question question);

    //查询所有试题
    List<Question> findAllQuestion();

    //删除试题信息
    int deleteQuestion(String questionId);

    //查询试题详细信息
    Question findByIdQuestion(Integer questionId);

    //修改试题信息
    int upDateQuestion(Question question);

    //随机添加5道试题
    List<Question> findRandQuestion();

    //ajax搜索试题信息
    Question queryQuestion(String questionId);

    //考试记录
    int examinationRecords (Record record);

    //查询所有的考试记录
    List<Record> recordAll();

    //查询个人的考试记录
    List<Record> queries(String userName);
}
