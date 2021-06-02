package me.jie2g.exam.dao;

import me.jie2g.exam.domain.BankSingleChoiceQue;
import me.jie2g.exam.domain.BankSingleChoiceQueExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BankSingleChoiceQueMapper {
    int countByExample(BankSingleChoiceQueExample example);

    int deleteByExample(BankSingleChoiceQueExample example);

    int deleteByPrimaryKey(Integer singleId);

    int insert(BankSingleChoiceQue record);

    int insertSelective(BankSingleChoiceQue record);

    List<BankSingleChoiceQue> selectByExample(BankSingleChoiceQueExample example);

    BankSingleChoiceQue selectByPrimaryKey(Integer singleId);

    int updateByExampleSelective(@Param("record") BankSingleChoiceQue record, @Param("example") BankSingleChoiceQueExample example);

    int updateByExample(@Param("record") BankSingleChoiceQue record, @Param("example") BankSingleChoiceQueExample example);

    int updateByPrimaryKeySelective(BankSingleChoiceQue record);

    int updateByPrimaryKey(BankSingleChoiceQue record);

    List<BankSingleChoiceQue> getSingleQueListByPaperId(Integer paperId);

    List<BankSingleChoiceQue> getRandomSingleByCountAndLangId(@Param("langId") Integer langId, @Param("singleNum")Integer singleNum);
}