package me.jie2g.exam.util;

import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;

import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale;
import java.util.UUID;

/**
 * 文件存储工具
 */
public class FileStorageUtil {
	
	public static final String STATIC_UPLOAD_IMG = "static/upload/img";
	public static final String STATIC_DOC = "/doc";
	
	private static final String ROOT_PATH_IMG = "/www/wwwroot/exam/img";
	public static final String ROOT_PATH_DOC = "/www/wwwroot/exam/doc";
	private static final String ROOT_URL = "/img";
	
	
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
	
	/**
	 * 获取外部资源路径
	 *
	 * @param scheme      协议名
	 * @param serverName  服务器名
	 * @param port        端口号
	 * @param contextPath 上下文路径
	 * @param fileName    文件名
	 * @return 返回绝对资源路径
	 */
	public static String getExternalPath (String scheme, String serverName, int port, String contextPath, String fileName) {
		return String.format (Locale.CHINA, "%s://%s:%d%s/%s", scheme, serverName, port, contextPath, fileName);
	}
	
	public static String getExternalPath (String scheme, String serverName, int port, String fileName) {
		return String.format (Locale.CHINA, "%s://%s:%d%s", scheme, serverName, port, fileName);
	}
	
	/**
	 * 保存图片
	 *
	 * @param data     图片数据
	 * @param fileName 文件名
	 * @return 保存成功返回相对路径
	 * @throws IOException 如果发生 IO 异常
	 */
	public static String saveImage (byte[] data, String fileName) throws IOException {
		
		// 生成文件名
		File targetFile = new File (ROOT_PATH_IMG, fileName);
		
		BufferedOutputStream out = new BufferedOutputStream (new FileOutputStream (targetFile.getAbsolutePath ()));
		out.write (data, 0, data.length);
		out.flush ();
		
		// 返回资源路径
		return String.format (Locale.CHINA, "%s/%s", ROOT_URL, fileName);
	}
	
	/**
	 * 删除图片
	 *
	 * @param fileName 图片文件名
	 * @throws URISyntaxException 如果发生 URI 错误
	 */
	public static void deleteImage (String fileName) throws URISyntaxException {
		if (StringUtils.isEmpty (fileName)) {
			return;
		}
		URI uri = new URI (fileName);
		
		File file = new File (ROOT_PATH_IMG, uri.getRawPath ());
		if (file.exists ()) {
			file.deleteOnExit ();
		}
	}
	
	/**
	 * 获取资源路径
	 *
	 * @param resourcePath 资源路径
	 * @return 返回文件路径
	 */
	public static String getResourcePath (String resourcePath) {
		File path;
		try {
			path = new File (ResourceUtils.getURL (ResourceUtils.CLASSPATH_URL_PREFIX).toString ());
		} catch (Exception e) {
			e.printStackTrace ();
			return null;
		}
		
		if (!path.exists ())
			path = new File ("");
		
		File upload = new File (path.getAbsolutePath (), resourcePath);
		if (!upload.exists ()) {
			if (!upload.mkdirs ()) {   // 创建目录
				return null;
			}
		}
		return upload.getAbsolutePath ();
	}
}
