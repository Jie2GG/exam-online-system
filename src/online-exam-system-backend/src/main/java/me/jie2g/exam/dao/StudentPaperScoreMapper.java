package me.jie2g.exam.dao;

import me.jie2g.exam.domain.StudentPaperScore;
import me.jie2g.exam.domain.StudentPaperScoreExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentPaperScoreMapper {
    int countByExample(StudentPaperScoreExample example);

    int deleteByExample(StudentPaperScoreExample example);

    int deleteByPrimaryKey(Integer scoreId);

    int insert(StudentPaperScore record);

    int insertSelective(StudentPaperScore record);

    List<StudentPaperScore> selectByExample(StudentPaperScoreExample example);

    StudentPaperScore selectByPrimaryKey(Integer scoreId);

    int updateByExampleSelective(@Param("record") StudentPaperScore record, @Param("example") StudentPaperScoreExample example);

    int updateByExample(@Param("record") StudentPaperScore record, @Param("example") StudentPaperScoreExample example);

    int updateByPrimaryKeySelective(StudentPaperScore record);

    int updateByPrimaryKey(StudentPaperScore record);
}