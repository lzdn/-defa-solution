package com.defa.manage.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.defa.manage.web.BaseController;
import com.defa.utils.ftp.FtpUtil;

@Controller
@RequestMapping("upload")
public class UploadController extends BaseController {

	protected final long MAX_SIZE = 5242880L;

	@RequestMapping(value = "/uploadimage", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> uploadimage(@RequestParam("fileElem") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<>();
		long size = file.getSize();
		if (MAX_SIZE > size) {
			String fileType = file.getContentType();
			String imgFormat = null;// 图片格式
			if ("image/pjpeg".equals(fileType) || "image/jpeg".equals(fileType)) {
				imgFormat = "jpeg";
			} else if ("image/png".equals(fileType) || "image/x-png".equals(fileType)) {
				imgFormat = "png";
			} else {
				map.put("success", false);
				map.put("msg", "文件格式不正确（必须为.jpg/.png文件）");
				//response.setContentType("text/html;charset=utf-8");
				//response.getWriter().write(JSONObject.toJSONString(map));
				return map;
			}
		 
			BufferedImage sourceImage = ImageIO.read(file.getInputStream());
			String fileUrl = null;
			String upload_file_name = FtpUtil.upload(file.getInputStream(), imgFormat);
			if (StringUtils.isNotEmpty(upload_file_name)) {
				String host = "http://webresource.defa1688.com/";
				fileUrl = host + upload_file_name;
			}
			if (StringUtils.isNotEmpty(fileUrl)) {
				DecimalFormat df = new DecimalFormat(".##");
				map.put("success", true);
				map.put("msg", fileUrl);
				double k = size / 1024 / 1024.0;
				if (k > 1) {
					map.put("filesize", df.format(k) + "M");
				} else {
					map.put("filesize", df.format(size / 1024.0) + "KB");
				}
				// 计算图片宽高
				map.put("width", sourceImage.getWidth());
				map.put("height", sourceImage.getHeight());
				//response.setContentType("text/html;charset=utf-8");
				//response.getWriter().write(JSONObject.toJSONString(map));
				return map;

			} else {
				map.put("success", false);
				map.put("msg", "上传失败，服务器繁忙请稍后再上传！");
				//response.setContentType("text/html;charset=utf-8");
				//response.getWriter().write(JSONObject.toJSONString(map));
				return map;
			}
		} else {
			map.put("success", false);
			map.put("msg", "上传图片不能超过5M");
			//response.setContentType("text/html;charset=utf-8");
			//response.getWriter().write(JSONObject.toJSONString(map));
			return map;
		}

	}
}
