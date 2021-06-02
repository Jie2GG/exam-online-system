package me.jie2g.exam.service;

import java.util.List;
import java.util.Map;

public interface StudentSearchService {
    public List<Map<String, Object>> getSearchPapers(String keyword);
}
