package me.jie2g.exam.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale;
import java.util.UUID;

@Component
public class FileStoreUtils {
	
	@Value ("${file.path.img}")
	private String imgPath;
	
	@Value ("${file.path.doc}")
	private String docPath;
	
	@Value ("${url.img}")
	private String imgUrl;
	
	@Value ("${url.doc}")
	private String docUrl;
	
	@Value ("${url.root}")
	private String rootUrl;
	
	/**
	 * 保存图片
	 *
	 * @param data
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public String saveImage (byte[] data, String fileName) throws IOException {
		String savePath = saveFile (data, fileName, imgPath, imgUrl);
		return String.format (Locale.CHINA, "%s%s", rootUrl, savePath);
	}
	
	/**
	 * 删除图片
	 *
	 * @param fileName
	 * @throws URISyntaxException
	 */
	public void deleteImage (String fileName) throws URISyntaxException {
		deleteFile (fileName, imgPath);
	}
	
	/**
	 * 保存文档
	 *
	 * @param data
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public String saveDocument (byte[] data, String fileName) throws IOException {
		String savePath = saveFile (data, fileName, docPath, docUrl);
		return String.format (Locale.CHINA, "%s%s", rootUrl, savePath);
	}
	
	/**
	 * 删除文档
	 *
	 * @param fileName
	 * @throws URISyntaxException
	 */
	public void deleteDocument (String fileName) throws URISyntaxException {
		deleteFile (fileName, docPath);
	}
	
	/**
	 * 获取 UUID 文件名称
	 *
	 * @param extendName 文件扩展名
	 * @return 一个 UUID 生成的文件名
	 */
	public static String getFileName (String extendName) {
		String fileName = UUID.randomUUID ().toString ();
		return String.format (Locale.CHINA, "%s.%s", fileName, extendName);
		
	}
	
	private String saveFile (byte[] data, String fileName, String targetPath, String baseUrl) throws IOException {
		if (checkPath (targetPath)) {
			File targetFile = new File (targetPath, fileName); // /www/wwwroot/exam/static/img/xxx.jpg
			
			BufferedOutputStream out = new BufferedOutputStream (new FileOutputStream (targetFile.getAbsolutePath ()));
			out.write (data, 0, data.length);
			out.flush ();
			out.close ();
			
			return String.format (Locale.CHINA, "%s/%s", baseUrl, fileName);
		}
		return null;
	}
	
	private void deleteFile (String fileName, String targetPath) throws URISyntaxException {
		if (checkPath (targetPath)) {
			
			URI uri = new URI (fileName);
			File targetFile = new File (targetPath, uri.getRawPath ());
			
			if (targetFile.exists ()) {
				targetFile.deleteOnExit ();
			}
			
		}
	}
	
	private static boolean checkPath (String path) {
		File file = new File (path);
		if (!file.exists ()) {
			return file.mkdirs ();
		}
		return true;
	}
}
