package me.jie2g.exam.dao;

import me.jie2g.exam.domain.TeacherNotice;
import me.jie2g.exam.domain.TeacherNoticeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TeacherNoticeMapper {
    int countByExample(TeacherNoticeExample example);

    int deleteByExample(TeacherNoticeExample example);

    int deleteByPrimaryKey(Integer noticeId);

    int insert(TeacherNotice record);

    int insertSelective(TeacherNotice record);

    List<TeacherNotice> selectByExample(TeacherNoticeExample example);

    TeacherNotice selectByPrimaryKey(Integer noticeId);

    int updateByExampleSelective(@Param("record") TeacherNotice record, @Param("example") TeacherNoticeExample example);

    int updateByExample(@Param("record") TeacherNotice record, @Param("example") TeacherNoticeExample example);

    int updateByPrimaryKeySelective(TeacherNotice record);

    int updateByPrimaryKey(TeacherNotice record);
}