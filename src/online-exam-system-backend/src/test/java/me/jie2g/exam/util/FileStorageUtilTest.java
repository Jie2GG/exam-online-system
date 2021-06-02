package me.jie2g.exam.util;

import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.nio.charset.StandardCharsets;

//@RunWith (SpringRunner.class)
//@SpringBootTest (webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class FileStorageUtilTest {
	
	@Test
	public void testSaveImage () {
		System.out.println ("-------Start-------");
		
		try {
//			FileStorageUtil.deleteImage ("http://localhost:8080/static/upload/img/c427dc51-ab96-4cb6-9c40-2d70b9b3e56f");
			String p = FileStorageUtil.saveImage (null, "1.jpg");
			System.out.println (p);
		} catch (Exception e) {
		
		}
		
		System.out.println ("--------End--------");
	}
}