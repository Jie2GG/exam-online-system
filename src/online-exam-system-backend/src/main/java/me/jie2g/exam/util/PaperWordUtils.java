package me.jie2g.exam.util;

import me.jie2g.exam.domain.BankFillQue;
import me.jie2g.exam.domain.BankJudgeQue;
import me.jie2g.exam.domain.BankMultipleChoiceQue;
import me.jie2g.exam.domain.BankSingleChoiceQue;
import org.apache.poi.ooxml.POIXMLDocumentPart;
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.*;
import org.springframework.util.StringUtils;

import javax.validation.constraints.Null;
import java.io.*;
import java.math.BigInteger;
import java.security.Timestamp;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

/**
 * 试卷 Word 文档工具类
 */
public class PaperWordUtils {
	
	//region --字段--
	private final File file;
	private final XWPFDocument document;
	private int questionNumber;
	//endregion
	
	//region --构造函数--
	private PaperWordUtils (String path) throws IOException {
		this.file = new File (path);
		if (this.file.exists ()) {
			this.file.deleteOnExit ();
		}
		this.document = new XWPFDocument ();
		CTSectPr ctSectPr = this.document.getDocument ().getBody ().addNewSectPr ();
		
		// 设置纸张大小，方向
		CTPageSz ctPageSz = ctSectPr.addNewPgSz ();
		ctPageSz.setW (BigInteger.valueOf (20639));
		ctPageSz.setH (BigInteger.valueOf (14572));
		ctPageSz.setOrient (STPageOrientation.LANDSCAPE);   // 横向纸张
		
		// 设置二分栏
		CTColumns cols = ctSectPr.addNewCols ();
		cols.setNum (BigInteger.valueOf (2));
		
		// 题号
		this.questionNumber = 0;
	}
	//endregion
	
	//region --公开方法--
	
	/**
	 * 设置标题
	 *
	 * @param title 标题
	 * @return 返回 {@link PaperWordUtils} 实例
	 */
	public PaperWordUtils setTitle (String title) {
		setParagraph (this.document, "宋体", true, 32, ParagraphAlignment.CENTER, title, 0);
		return this;
	}
	
	/**
	 * 设置子标题
	 *
	 * @param subTitle 子标题
	 * @return 返回 {@link PaperWordUtils} 实例
	 */
	public PaperWordUtils setSubTitle (String subTitle) {
		setParagraph (this.document, "宋体", true, 32, ParagraphAlignment.CENTER, subTitle, 0);
		setParagraph (this.document, "宋体", true, 21, ParagraphAlignment.CENTER, "", 0);
		return this;
	}
	
	/**
	 * 设置基本信息
	 *
	 * @param minutes 考试时长. (单位: 分钟)
	 * @param score   分数
	 * @return 返回 {@link PaperWordUtils} 实例
	 */
	public PaperWordUtils setBasicInfo (int minutes, int score) {
		
		if (minutes < 0) {
			throw new IllegalArgumentException ("指定考试时长不能低于 0 分钟");
		}
		
		if (score < 0) {
			throw new IllegalArgumentException ("指定试卷的分数不可低于 0 分");
		}
		
		setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.CENTER,
				String.format (Locale.CHINA, "考试时间 %d 分钟, 满分 %d 分 ", minutes, score),
				0);
		setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.CENTER, "", 0);
		setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.CENTER, "", 0);
		
		return this;
	}
	
	/**
	 * 设置单选题
	 *
	 * @param singleChoiceQues 单选题列表
	 * @param singleScore      单选题分值
	 * @return 返回 {@link PaperWordUtils} 实例
	 */
	public PaperWordUtils setSingleChoiceQue (List<BankSingleChoiceQue> singleChoiceQues, int singleScore) {
		
		if (singleChoiceQues == null) {
			throw new NullPointerException ("singleChoiceQues 参数不能为 null");
		}
		
		if (singleScore < 0) {
			throw new IllegalArgumentException ("singleScore 不能为负数");
		}
		
		// 增加小标题
		this.questionNumber += 1;
		String title = String.format (Locale.CHINA, "%s、单选题: 每题 %d 分, 共 %d 分",
				toChinese (String.valueOf (this.questionNumber)),
				singleScore,
				singleChoiceQues.size () * singleScore);
		setParagraph (this.document, "宋体", true, 21, ParagraphAlignment.LEFT, title, 0);
		
		int tempNumber = 0;
		// 增加题目
		for (BankSingleChoiceQue singleChoiceQue : singleChoiceQues) {
			tempNumber += 1;    // 题号
			
			// 单选题目
			String topic = String.format (Locale.CHINA, "%d. %s",
					tempNumber,
					singleChoiceQue.getSingleContent ()
			);
			setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, topic, 200);
			
			// 答案A
			if (!StringUtils.isEmpty (singleChoiceQue.getChoiceA ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, singleChoiceQue.getChoiceA (), 400);
			}
			
			// 答案B
			if (!StringUtils.isEmpty (singleChoiceQue.getChoiceB ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, singleChoiceQue.getChoiceB (), 400);
			}
			
			// 答案C
			if (!StringUtils.isEmpty (singleChoiceQue.getChoiceC ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, singleChoiceQue.getChoiceC (), 400);
			}
			
			// 答案D
			if (!StringUtils.isEmpty (singleChoiceQue.getChoiceD ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, singleChoiceQue.getChoiceD (), 400);
			}
			
			// 答案E
			if (!StringUtils.isEmpty (singleChoiceQue.getChoiceE ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, singleChoiceQue.getChoiceE (), 400);
			}
			
			// 答案F
			if (!StringUtils.isEmpty (singleChoiceQue.getChoiceF ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, singleChoiceQue.getChoiceF (), 400);
			}
			
			// 答案G
			if (!StringUtils.isEmpty (singleChoiceQue.getChoiceG ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, singleChoiceQue.getChoiceG (), 400);
			}
			
			// 换行
			setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, "", 0);
		}
		
		setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, "", 0);  // 总换行
		return this;
	}
	
	/**
	 * 设置多选题
	 *
	 * @param multipleChoiceQues 多选题列表
	 * @param multipleScore      多选题分值
	 * @return 返回 {@link PaperWordUtils} 实例
	 */
	public PaperWordUtils setMultipleChoiceQue (List<BankMultipleChoiceQue> multipleChoiceQues, int multipleScore) {
		
		if (multipleChoiceQues == null) {
			throw new NullPointerException ("multipleChoiceQues 参数不能为 null");
		}
		
		if (multipleScore < 0) {
			throw new IllegalArgumentException ("multipleScore 不能为负数");
		}
		
		// 增加小标题
		this.questionNumber += 1;
		String title = String.format (Locale.CHINA, "%s、多选题: 每题 %d 分, 共 %d 分",
				toChinese (String.valueOf (this.questionNumber)),
				multipleScore,
				multipleChoiceQues.size () * multipleScore);
		setParagraph (this.document, "宋体", true, 21, ParagraphAlignment.LEFT, title, 0);
		
		int tempNumber = 0;
		// 增加题目
		for (BankMultipleChoiceQue multipleChoiceQue : multipleChoiceQues) {
			tempNumber += 1;
			
			// 题目
			String topic = String.format (Locale.CHINA, "%d. %s",
					tempNumber,
					multipleChoiceQue.getMultipleContent ()
			);
			setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, topic, 200);
			
			// 答案A
			if (!StringUtils.isEmpty (multipleChoiceQue.getChoiceA ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, multipleChoiceQue.getChoiceA (), 400);
			}
			// 答案B
			if (!StringUtils.isEmpty (multipleChoiceQue.getChoiceB ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, multipleChoiceQue.getChoiceB (), 400);
			}
			// 答案C
			if (!StringUtils.isEmpty (multipleChoiceQue.getChoiceC ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, multipleChoiceQue.getChoiceC (), 400);
			}
			// 答案D
			if (!StringUtils.isEmpty (multipleChoiceQue.getChoiceD ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, multipleChoiceQue.getChoiceD (), 400);
			}
			// 答案E
			if (!StringUtils.isEmpty (multipleChoiceQue.getChoiceE ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, multipleChoiceQue.getChoiceE (), 400);
			}
			// 答案F
			if (!StringUtils.isEmpty (multipleChoiceQue.getChoiceF ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, multipleChoiceQue.getChoiceF (), 400);
			}
			// 答案G
			if (!StringUtils.isEmpty (multipleChoiceQue.getChoiceG ())) {
				setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, multipleChoiceQue.getChoiceG (), 400);
			}
			
			setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, "", 0);
		}
		
		setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, "", 0);
		return this;
	}
	
	/**
	 * 设置判断题
	 *
	 * @param judgeChoiceQues 判断题列表
	 * @param judgeScore      判断题分值
	 * @return 返回 {@link PaperWordUtils} 实例
	 */
	public PaperWordUtils setJudgeChoiceQue (List<BankJudgeQue> judgeChoiceQues, int judgeScore) {
		
		if (judgeChoiceQues == null) {
			throw new NullPointerException ("judgeChoiceQues 参数不能为 null");
		}
		
		if (judgeScore < 0) {
			throw new IllegalArgumentException ("judgeScore 不能为负数");
		}
		
		// 增加小标题
		this.questionNumber += 1;
		String title = String.format (Locale.CHINA, "%s、判断题: 每题 %d 分, 共 %d 分",
				toChinese (String.valueOf (this.questionNumber)),
				judgeScore,
				judgeChoiceQues.size () * judgeScore);
		setParagraph (this.document, "宋体", true, 21, ParagraphAlignment.LEFT, title, 0);
		
		int tempNumber = 0;
		
		for (BankJudgeQue judgeChoiceQue : judgeChoiceQues) {
			
			tempNumber += 1;
			
			// 题目
			String topic = String.format (Locale.CHINA, "%d. %s (  ).",
					tempNumber,
					judgeChoiceQue.getJudgeContent ()
			);
			
			setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, topic, 200);
			
			// 换行
			setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, "", 0);
		}
		
		setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, "", 0);
		return this;
	}
	
	/**
	 * 设置填空题
	 *
	 * @param fillChoiceQues 填空题列表
	 * @param fillScore      填空题分值
	 * @return 返回 {@link PaperWordUtils} 实例
	 */
	public PaperWordUtils setFillChoiceQue (List<BankFillQue> fillChoiceQues, int fillScore) {
		
		if (fillChoiceQues == null) {
			throw new NullPointerException ("fillChoiceQues 参数不能为 null");
		}
		
		if (fillScore < 0) {
			throw new IllegalArgumentException ("fillScore 不能为负数");
		}
		
		// 增加小标题
		this.questionNumber += 1;
		String title = String.format (Locale.CHINA, "%s、填空题: 每题 %d 分, 共 %d 分",
				toChinese (String.valueOf (this.questionNumber)),
				fillScore,
				fillChoiceQues.size () * fillScore);
		setParagraph (this.document, "宋体", true, 21, ParagraphAlignment.LEFT, title, 0);
		
		int tempNumber = 0;
		
		for (BankFillQue fillChoiceQue : fillChoiceQues) {
			tempNumber += 1;
			
			// 题目
			String topic = String.format (Locale.CHINA, "%d. %s",
					tempNumber,
					fillChoiceQue.getFillContent ()
			);
			setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, topic, 200);
			
			setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, "", 0);
		}
		
		setParagraph (this.document, "宋体", false, 21, ParagraphAlignment.LEFT, "", 0);
		
		return this;
	}
	
	/**
	 * 保存文档
	 *
	 * @throws IOException 如果发生 IO 异常
	 */
	public void save () throws IOException {
		this.document.write (new FileOutputStream (this.file));
	}
	//endregion
	
	//region --静态方法--
	
	/**
	 * 创建 Word 文档
	 *
	 * @param path word 文档位置
	 * @return Word 文档读写工具
	 * @throws IOException 如果发生 IO 异常
	 */
	public static PaperWordUtils open (String path) throws IOException {
		return new PaperWordUtils (path);
	}
	
	private static void setParagraph (XWPFDocument doc, String fontFamily, boolean bold, long fontSize, ParagraphAlignment alignment, String content, long leftSpace) {
		XWPFParagraph paragraph = doc.createParagraph ();
		// 对其方式
		paragraph.setAlignment (alignment);
		
		XWPFRun run = paragraph.createRun ();
		if (run != null) {
			// 设置文字
			run.setText (content);
			// 设置字体
			run.setBold (bold);     // 粗体
			
			CTR ctr = run.getCTR ();
			if (ctr != null) {
				CTRPr ctrRPr = ctr.getRPr ();
				if (ctrRPr == null) {
					ctrRPr = ctr.addNewRPr ();
				}
				
				// 设置字体
				CTFonts ctFonts = ctrRPr.isSetRFonts () ? ctrRPr.getRFonts () : ctrRPr.addNewRFonts ();
				ctFonts.setAscii (fontFamily);
				ctFonts.setEastAsia (fontFamily);
				ctFonts.setHAnsi (fontFamily);
				
				// 设置字体大小
				CTHpsMeasure ctHpsMeasure = ctrRPr.isSetSz () ? ctrRPr.getSz () : ctrRPr.addNewSz ();
				ctHpsMeasure.setVal (BigInteger.valueOf (fontSize));      // 16磅, 三号字
				
				CTHpsMeasure ctHpsMeasureCs = ctrRPr.isSetSzCs () ? ctrRPr.getSzCs () : ctrRPr.addNewSzCs ();
				ctHpsMeasureCs.setVal (BigInteger.valueOf (fontSize));    // 16磅, 三号字
			}
		}
		
		CTP ctp = paragraph.getCTP ();
		if (ctp != null) {
			CTPPr pPr = ctp.getPPr ();
			if (pPr == null) {
				pPr = ctp.addNewPPr ();
			}
			
			CTInd ind = pPr.getInd ();
			if (ind == null) {
				ind = pPr.addNewInd ();
			}
			ind.setLeft (BigInteger.valueOf (leftSpace));
			ind.setLeftChars (BigInteger.valueOf (leftSpace));
		}
	}
	
	private static String toChinese (String str) {
		String[] s1 = {"零", "一", "二", "三", "四", "五", "六", "七", "八", "九"};
		String[] s2 = {"十", "百", "千", "万", "十", "百", "千", "亿", "十", "百", "千"};
		String result = "";
		int n = str.length ();
		for (int i = 0; i < n; i++) {
			int num = str.charAt (i) - '0';
			if (i != n - 1 && num != 0) {
				result += s1[num] + s2[n - 2 - i];
			} else {
				result += s1[num];
			}
		}
		return result;
	}
	//endregion
}
