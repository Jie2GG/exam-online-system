package me.jie2g.exam.service;

import me.jie2g.exam.domain.StudentFeedback;

import java.util.List;
import java.util.Map;

public interface AdminFeedbackService {
    public List<Map<String, Object>> getFeedbacksList();
    public int getUnReplyCount();
    public List<Map<String, Object>> searchFeedbacksList(String feedbackContent,
                                                         String stuName,
                                                         String admAnswer,
                                                         String admName,
                                                         String feedbackStatus);
    public int deleteFeedback(Integer feedbackId);
    public int replyFeedback(StudentFeedback studentFeedback);
}
