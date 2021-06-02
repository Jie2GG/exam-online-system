package me.jie2g.exam.dao;

import me.jie2g.exam.domain.PaperQue;
import me.jie2g.exam.domain.PaperQueExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PaperQueMapper {
    int countByExample(PaperQueExample example);

    int deleteByExample(PaperQueExample example);

    int deleteByPrimaryKey(Integer queId);

    int insert(PaperQue record);

    int insertSelective(PaperQue record);

    List<PaperQue> selectByExample(PaperQueExample example);

    PaperQue selectByPrimaryKey(Integer queId);

    int updateByExampleSelective(@Param("record") PaperQue record, @Param("example") PaperQueExample example);

    int updateByExample(@Param("record") PaperQue record, @Param("example") PaperQueExample example);

    int updateByPrimaryKeySelective(PaperQue record);

    int updateByPrimaryKey(PaperQue record);
}