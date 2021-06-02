package me.jie2g.exam.dao;

import me.jie2g.exam.domain.ProgramingLanguage;
import me.jie2g.exam.domain.ProgramingLanguageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProgramingLanguageMapper {
    int countByExample(ProgramingLanguageExample example);

    int deleteByExample(ProgramingLanguageExample example);

    int deleteByPrimaryKey(Integer langId);

    int insert(ProgramingLanguage record);

    int insertSelective(ProgramingLanguage record);

    List<ProgramingLanguage> selectByExample(ProgramingLanguageExample example);

    ProgramingLanguage selectByPrimaryKey(Integer langId);

    int updateByExampleSelective(@Param("record") ProgramingLanguage record, @Param("example") ProgramingLanguageExample example);

    int updateByExample(@Param("record") ProgramingLanguage record, @Param("example") ProgramingLanguageExample example);

    int updateByPrimaryKeySelective(ProgramingLanguage record);

    int updateByPrimaryKey(ProgramingLanguage record);
}