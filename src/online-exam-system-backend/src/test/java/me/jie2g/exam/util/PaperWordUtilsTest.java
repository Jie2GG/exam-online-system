package me.jie2g.exam.util;

import junit.framework.TestCase;
import me.jie2g.exam.controller.TeacherPaperController;
import me.jie2g.exam.dao.BankFillQueMapper;
import me.jie2g.exam.dao.BankJudgeQueMapper;
import me.jie2g.exam.dao.BankMultipleChoiceQueMapper;
import me.jie2g.exam.dao.BankSingleChoiceQueMapper;
import org.apache.poi.ooxml.POIXMLDocumentPart;
import org.apache.poi.xwpf.usermodel.IBodyElement;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openxmlformats.schemas.spreadsheetml.x2006.main.WorkbookDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;

@RunWith (SpringRunner.class)
@SpringBootTest (webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class PaperWordUtilsTest {
	
	@Autowired
	public TeacherPaperController teacherPaperController;
	
	@Test
	public void createWordTest () throws Exception {

//		PaperWordUtils word = PaperWordUtils.open ("D:\\生成的试卷.doc");
//		word.setTitle ("2020 - 2021 年度第二学期");
//		word.setSubTitle ("XXX科目考试");
//		word.setBasicInfo (60, 100);
//		word.setSingleChoiceQue (bankSingleChoiceQueMapper.getSingleQueListByPaperId (1), 20);
//		word.setMultipleChoiceQue (bankMultipleChoiceQueMapper.getMultipleQueListByPaperId (1), 2);
//		word.setJudgeChoiceQue (bankJudgeQueMapper.getJudgeQueListByPaperId (1), 2);
//		word.setFillChoiceQue (bankFillQueMapper.getFillQueListByPaperId (1), 2);
//		word.save ();
	}
}