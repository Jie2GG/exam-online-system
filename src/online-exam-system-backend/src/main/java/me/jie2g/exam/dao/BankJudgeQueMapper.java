package me.jie2g.exam.dao;

import me.jie2g.exam.domain.BankJudgeQue;
import me.jie2g.exam.domain.BankJudgeQueExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BankJudgeQueMapper {
    int countByExample(BankJudgeQueExample example);

    int deleteByExample(BankJudgeQueExample example);

    int deleteByPrimaryKey(Integer judgeId);

    int insert(BankJudgeQue record);

    int insertSelective(BankJudgeQue record);

    List<BankJudgeQue> selectByExample(BankJudgeQueExample example);

    BankJudgeQue selectByPrimaryKey(Integer judgeId);

    int updateByExampleSelective(@Param("record") BankJudgeQue record, @Param("example") BankJudgeQueExample example);

    int updateByExample(@Param("record") BankJudgeQue record, @Param("example") BankJudgeQueExample example);

    int updateByPrimaryKeySelective(BankJudgeQue record);

    int updateByPrimaryKey(BankJudgeQue record);

    List<BankJudgeQue> getJudgeQueListByPaperId(Integer paperId);

    List<BankJudgeQue> getRandomJudgeByCountAndLangId(@Param("langId") Integer langId, @Param("judgeNum")Integer judgeNum);
}