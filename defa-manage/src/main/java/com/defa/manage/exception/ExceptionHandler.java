package com.defa.manage.exception;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ControllerAdvice;

import com.defa.utils.exception.BusinessException;
import com.defa.utils.exception.PermissionException;

@ControllerAdvice("com.defa")
public class ExceptionHandler {

	/**
	 * 全局异常处理
	 * @param response
	 * @param e
	 */
	@org.springframework.web.bind.annotation.ExceptionHandler(value = Exception.class)
	public void globalHandler(HttpServletResponse response, Exception e) {
		try {
			StringWriter out = new StringWriter();
			e.printStackTrace(new PrintWriter(out)); 
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			response.getOutputStream().write(("系统异常：" + out.toString()).getBytes());
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	/**
	 * 业务异常处理
	 * @param response
	 * @param e
	 */
	@org.springframework.web.bind.annotation.ExceptionHandler(value = BusinessException.class)
	public void BussinessException(HttpServletResponse response, BusinessException e) {
		try {
			StringWriter out = new StringWriter();
			e.printStackTrace(new PrintWriter(out)); 
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			response.getOutputStream().write(("业务异常：" + out.toString()).getBytes());
			//response.sendRedirect(location);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	/**
	 * 权限异常处理
	 * @param response
	 * @param e
	 */
	@org.springframework.web.bind.annotation.ExceptionHandler(value = PermissionException.class)
	public void PermissionException(HttpServletRequest request,HttpServletResponse response, PermissionException e) {
		try {
			StringWriter out = new StringWriter();
			e.printStackTrace(new PrintWriter(out)); 
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			response.getOutputStream().write((e.getMessage()).getBytes());
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

}
