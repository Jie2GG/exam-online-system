package me.jie2g.exam.service.impl;

import me.jie2g.exam.dao.PaperMapper;
import me.jie2g.exam.dao.ProgramingLanguageMapper;
import me.jie2g.exam.domain.PaperExample;
import me.jie2g.exam.domain.ProgramingLanguage;
import me.jie2g.exam.domain.ProgramingLanguageExample;
import me.jie2g.exam.service.AdminSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class AdminSubjectServiceImpl implements AdminSubjectService {

    @Autowired
    ProgramingLanguageMapper programingLanguageMapper;
    @Autowired
    PaperMapper paperMapper;

    @Override
    public List<Map<String, Object>> getSubjectsList() {
        List<Map<String, Object>> resultList = new ArrayList<>();
        ProgramingLanguageExample programingLanguageExample = new ProgramingLanguageExample();
        programingLanguageExample.setOrderByClause("lang_id asc");
        List<ProgramingLanguage> programingLanguageList = programingLanguageMapper.selectByExample(programingLanguageExample);
        for (ProgramingLanguage programingLanguage : programingLanguageList) {
            int index = programingLanguageList.indexOf(programingLanguage);
            Map<String, Object> map = new HashMap<>();
            map.put("id", index + 1);
            map.put("langId", programingLanguage.getLangId());
            map.put("langName", programingLanguage.getLangName());
            map.put("langDesc", programingLanguage.getLangDesc());
            map.put("langImgSrc", programingLanguage.getLangImgSrc());
            map.put("langCreatedBy", programingLanguage.getLangCreatedBy());
            map.put("langChangeTime", programingLanguage.getLangChangeTime());
            map.put("langLastChanger", programingLanguage.getLangLastChanger());
            map.put("isRecommend", programingLanguage.getIsRecommend());
            PaperExample paperExample = new PaperExample();
            PaperExample.Criteria criteria = paperExample.createCriteria();
            criteria.andLangIdEqualTo(programingLanguage.getLangId());
            int paperCount = paperMapper.countByExample(paperExample);
            map.put("paperCount", paperCount);
            resultList.add(map);
        }
        return resultList;
    }

    @Override
    public List<Map<String, Object>> searchSubjectsList(String langName, String langDesc, String langCreatedBy, String isRecommend) {
        List<Map<String, Object>> resultList = new ArrayList<>();
        ProgramingLanguageExample programingLanguageExample = new ProgramingLanguageExample();
        ProgramingLanguageExample.Criteria criteria = programingLanguageExample.createCriteria();
        if (!langName.equals("undefined")) {
            criteria.andLangNameLike("%" + langName + "%");
        }
        if (!langDesc.equals("undefined")) {
            criteria.andLangDescLike("%" + langDesc + "%");
        }
        if (!langCreatedBy.equals("undefined")) {
            criteria.andLangCreatedByLike("%" + langCreatedBy + "%");
        }
        if (!StringUtils.isEmpty (isRecommend) && !isRecommend.equals("undefined")) {
            criteria.andIsRecommendEqualTo(isRecommend);
        }
        programingLanguageExample.setOrderByClause("lang_id asc");
        List<ProgramingLanguage> programingLanguageList = programingLanguageMapper.selectByExample(programingLanguageExample);
        for (ProgramingLanguage programingLanguage : programingLanguageList) {
            int index = programingLanguageList.indexOf(programingLanguage);
            Map<String, Object> map = new HashMap<>();
            map.put("id", index + 1);
            map.put("langId", programingLanguage.getLangId());
            map.put("langName", programingLanguage.getLangName());
            map.put("langDesc", programingLanguage.getLangDesc());
            map.put("langCreatedBy", programingLanguage.getLangCreatedBy());
            map.put("langImgSrc", programingLanguage.getLangImgSrc());
            map.put("langChangeTime", programingLanguage.getLangChangeTime());
            map.put("langLastChanger", programingLanguage.getLangLastChanger());
            map.put("isRecommend", programingLanguage.getIsRecommend());
            PaperExample paperExample = new PaperExample();
            PaperExample.Criteria criteria2 = paperExample.createCriteria();
            criteria2.andLangIdEqualTo(programingLanguage.getLangId());
            int paperCount = paperMapper.countByExample(paperExample);
            map.put("paperCount", paperCount);
            resultList.add(map);
        }
        return resultList;
    }

    @Override
    public int insertSubjectInfo(ProgramingLanguage programingLanguage) {
        programingLanguage.setLangCreateTime(new Date());
        int result = programingLanguageMapper.insertSelective(programingLanguage);
        return result;
    }

    @Override
    public int updateSubjectInfo(ProgramingLanguage programingLanguage) {
        programingLanguage.setLangChangeTime(new Date());
        int result = programingLanguageMapper.updateByPrimaryKeySelective(programingLanguage);
        return result;
    }

    @Override
    public int deleteSubject(Integer langId) {
        int result = programingLanguageMapper.deleteByPrimaryKey(langId);
        return result;
    }
}
