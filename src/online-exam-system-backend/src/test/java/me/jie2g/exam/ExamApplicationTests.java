package me.jie2g.exam;

import me.jie2g.exam.service.StudentProfileService;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.util.ResourceUtils;

import java.io.FileNotFoundException;

@RunWith (SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class ExamApplicationTests {
	
	@Before
	public void init () {
		System.out.println ("开始测试-----------------");
	}
	
	@After
	public void after () {
		System.out.println ("测试结束-----------------");
	}
	
	@Test
	public void contextLoads () {
		
		try {
			System.out.println (ResourceUtils.getURL (ResourceUtils.CLASSPATH_URL_PREFIX).getPath ());
		} catch (FileNotFoundException e) {
			e.printStackTrace ();
		}
	}
	
}
