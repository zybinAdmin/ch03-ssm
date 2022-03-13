package com.test.controller;

import com.test.domain.Question;
import com.test.domain.Record;
import com.test.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/question")
public class QuestionController {

    @Resource
    private QuestionService service;

    //试题添加
    @RequestMapping("/addQuestion.do")
    public String addQuestion(Model model,Question question){
        String tpis = "";
        int result = service.questionAdd(question);
        if (result >= 1){
            tpis = "试题添加成功";
        }
        model.addAttribute("tpis",tpis);
        return "info";
    }

    //试题删除
    @RequestMapping("/deleteQuestion.do")
    public ModelAndView deleteQuestion(String questionId){
        ModelAndView mv = new ModelAndView();
        int result = service.deleteQuestion(questionId);
        if (result >= 1){
            mv.setViewName("redirect:/question/findQuestion.do");
        }
        return mv;
    }

    //查询所有试题信息
    @RequestMapping("/findQuestion.do")
    public String findQuestion(Model model){
        List<Question> questionList = service.findAllQuestion();
        model.addAttribute("questionList",questionList);
        return "question_Find";
    }

    //查询用户详细信息
    @RequestMapping("/findByIdQuestion.do")
    public String findById(Model model, String questionId){
        Question question = service.findByIdQuestion(Integer.valueOf(questionId));
        model.addAttribute("question", question);
        return "question_update";
    }

    //搜索用户的信息
    @RequestMapping("/queryQuestion.do")
    @ResponseBody
    public Question queryQuestion(String questionId){
        Question question = service.queryQuestion(questionId);
        return question;
    }

    //修改试题信息
    @RequestMapping(value = "/updateQuestion.do", method = RequestMethod.GET)
    public String updateQuestion(Model model, Question question){
        int result = service.upDateQuestion(question);
        String tpis = "试题更新失败";
        if (result >= 1){
            tpis = "试题更新成功";
        }
        model.addAttribute("tpis",tpis);
        return "info";
    }

    //随机添加五道试题
    @RequestMapping("/randQuestion.do")
    public String randQuestion(Model model, HttpSession session){
        Date date = new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(date);
        session.setAttribute("time",time);
        List<Question> questionList = service.findRandQuestion();
        session.setAttribute("questionList",questionList);
        model.addAttribute("questionList",questionList);
        return "exam";
    }

    //计算考试的分数
    @RequestMapping("/examQuestion.do")
    public String exam(Model model, HttpServletRequest request,HttpSession session){
        //HttpSession session = request.getSession(false);
        List<Question> questionList = null;
        questionList = (List) session.getAttribute("questionList");
        int score = 0;
        for (Question question : questionList){
            String answer = question.getAnswer();
            Integer questionId = question.getQuestionId();
            String userAnawer = request.getParameter("answer_" + questionId);
            if (userAnawer != null){
                if(userAnawer.equals(answer)){
                    score+=20;
                }
            } else {
                score+=0;
            }
        }
        String userName = (String) session.getAttribute("userName");
        String time = (String) session.getAttribute("time");
        Record record = new Record(time,userName,score);
        int result = service.examinationRecords(record);
        model.addAttribute("tpis","你的成绩:" + score);
        return "info";
    }


    //查询所有考试记录
    @RequestMapping("/recordQuestion.do")
    public String record(Model model){
        List<Record> records = service.recordAll();
        model.addAttribute("records",records);
        return "record";
    }

    //查看当前登陆用户的考试记录
    @RequestMapping("/recordQuestion1.do")
    public String record1(Model model,String userName){
        List<Record> records = service.queries(userName);
        model.addAttribute("records",records);
        return "record";
    }
}
