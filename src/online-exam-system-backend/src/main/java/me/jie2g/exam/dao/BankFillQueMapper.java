package me.jie2g.exam.dao;

import me.jie2g.exam.domain.BankFillQue;
import me.jie2g.exam.domain.BankFillQueExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BankFillQueMapper {
    int countByExample(BankFillQueExample example);

    int deleteByExample(BankFillQueExample example);

    int deleteByPrimaryKey(Integer fillId);

    int insert(BankFillQue record);

    int insertSelective(BankFillQue record);

    List<BankFillQue> selectByExample(BankFillQueExample example);

    BankFillQue selectByPrimaryKey(Integer fillId);

    int updateByExampleSelective(@Param("record") BankFillQue record, @Param("example") BankFillQueExample example);

    int updateByExample(@Param("record") BankFillQue record, @Param("example") BankFillQueExample example);

    int updateByPrimaryKeySelective(BankFillQue record);

    int updateByPrimaryKey(BankFillQue record);

    List<BankFillQue> getFillQueListByPaperId(Integer paperId);

    List<BankFillQue> getRandomFillByCountAndLangId(@Param("langId") Integer langId, @Param("fillNum")Integer fillNum);
}