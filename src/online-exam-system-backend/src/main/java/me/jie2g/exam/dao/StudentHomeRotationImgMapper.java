package me.jie2g.exam.dao;

import me.jie2g.exam.domain.StudentHomeRotationImg;
import me.jie2g.exam.domain.StudentHomeRotationImgExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentHomeRotationImgMapper {
    int countByExample(StudentHomeRotationImgExample example);

    int deleteByExample(StudentHomeRotationImgExample example);

    int deleteByPrimaryKey(Integer imgId);

    int insert(StudentHomeRotationImg record);

    int insertSelective(StudentHomeRotationImg record);

    List<StudentHomeRotationImg> selectByExample(StudentHomeRotationImgExample example);

    StudentHomeRotationImg selectByPrimaryKey(Integer imgId);

    int updateByExampleSelective(@Param("record") StudentHomeRotationImg record, @Param("example") StudentHomeRotationImgExample example);

    int updateByExample(@Param("record") StudentHomeRotationImg record, @Param("example") StudentHomeRotationImgExample example);

    int updateByPrimaryKeySelective(StudentHomeRotationImg record);

    int updateByPrimaryKey(StudentHomeRotationImg record);
}