package org.common.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		File file = (File) model.get("downloadFile");

		String fileName = (String) model.get("fileName");

		System.out.println(fileName);
		response.setContentType(getContentType());

		response.setContentLength((int) file.length());

		String userAgent = request.getHeader("User-Agent");

		boolean ie = userAgent.indexOf("MSIE") > -1;

		if (ie) {
			fileName = URLEncoder.encode(file.getName(), "utf-8");

		} else {
			fileName = new String(fileName.getBytes("utf-8"), "8859_1");
		}

		response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		OutputStream out = response.getOutputStream();

		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);

		} catch (Exception e) {

			logger.error("File is not exists");

		} finally {

			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
				}
			}
		}

		out.flush();

	}
}
