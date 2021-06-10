package me.jie2g.exam.util;

import junit.framework.TestCase;
import me.jie2g.exam.controller.TeacherPaperController;
import me.jie2g.exam.dao.BankFillQueMapper;
import me.jie2g.exam.dao.BankJudgeQueMapper;
import me.jie2g.exam.dao.BankMultipleChoiceQueMapper;
import me.jie2g.exam.dao.BankSingleChoiceQueMapper;
import me.jie2g.exam.domain.BankFillQue;
import me.jie2g.exam.domain.BankJudgeQue;
import me.jie2g.exam.domain.BankMultipleChoiceQue;
import me.jie2g.exam.domain.BankSingleChoiceQue;
import me.jie2g.exam.service.TeacherPaperService;
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
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith (SpringRunner.class)
@SpringBootTest (webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class PaperWordUtilsTest {
	
	@Autowired
	public TeacherPaperService teacherPaperService;
	
	@Autowired
	public FileStoreUtils fileStoreUtils;
	
	@Test
	public void createWordTest () throws Exception {
		
		Map<String, Object> paperMap = this.teacherPaperService.getPaperQuesByPaperId (2);
		
		byte[] bytes = PaperWordUtils.open ()
				.setTitle ("title")
				.setSubTitle ("subTitle")
				.setBasicInfo (60, 100)
				.setSingleChoiceQue ((List<BankSingleChoiceQue>) paperMap.get ("singleData"), 2)
				.setMultipleChoiceQue ((List<BankMultipleChoiceQue>) paperMap.get ("multipleData"), 2)
				.setJudgeChoiceQue ((List<BankJudgeQue>) paperMap.get ("judgeData"), 2)
				.setFillChoiceQue ((List<BankFillQue>) paperMap.get ("fillData"), 2)
				.save ();
		
		FileOutputStream fileOutputStream = new FileOutputStream ("D:\\1.doc");
		fileOutputStream.write (bytes, 0, bytes.length);
		System.out.println ("输出成功");
	}
}