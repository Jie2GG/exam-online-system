package me.jie2g.exam.service;

import me.jie2g.exam.domain.StudentHomeRotationImg;

import java.util.List;
import java.util.Map;

public interface AdminRotationImgService {
    public List<Map<String, Object>> getRotationImgsList();
    public List<Map<String, Object>> searchRotationImgsList(String imgTitle, String admName);
    public int insertRotationImgInfo(StudentHomeRotationImg studentHomeRotationImg);
    public int updateRotationImgInfo(StudentHomeRotationImg studentHomeRotationImg);
    public int deleteRotationImgInfo(Integer imgId);
}
