package me.jie2g.exam.dao;

import me.jie2g.exam.domain.StudentFeedback;
import me.jie2g.exam.domain.StudentFeedbackExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentFeedbackMapper {
    int countByExample(StudentFeedbackExample example);

    int deleteByExample(StudentFeedbackExample example);

    int deleteByPrimaryKey(Integer feedbackId);

    int insert(StudentFeedback record);

    int insertSelective(StudentFeedback record);

    List<StudentFeedback> selectByExample(StudentFeedbackExample example);

    StudentFeedback selectByPrimaryKey(Integer feedbackId);

    int updateByExampleSelective(@Param("record") StudentFeedback record, @Param("example") StudentFeedbackExample example);

    int updateByExample(@Param("record") StudentFeedback record, @Param("example") StudentFeedbackExample example);

    int updateByPrimaryKeySelective(StudentFeedback record);

    int updateByPrimaryKey(StudentFeedback record);
}