package com.flk.common.filter;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.TeeOutputStream;

import com.flk.common.domain.CommonConstants;
import com.flk.common.utility.DateFormatUtils;
import com.flk.common.utility.RandomStringUtils;
import com.flk.common.utility.RandomUtils;

public class ReqRespWrapper  implements Filter {


	
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;

		this.getTypesafeRequestMap(httpServletRequest);
		BufferedRequestWrapper bufferedReqest = new BufferedRequestWrapper(httpServletRequest);
		BufferedResponseWrapper bufferedResponse = new BufferedResponseWrapper(httpServletResponse);

		
		getTrId(httpServletRequest);

		if (!httpServletRequest.getMethod().equals("OPTIONS")) {
			// Process
			chain.doFilter(bufferedReqest, bufferedResponse);
		}
	}

	private String getTrId(HttpServletRequest httpServletRequest) {
		String trId = "TRID_" + DateFormatUtils.getMillisecondsTime() + RandomStringUtils.randomAlphabetic(1) + RandomUtils.nextInt(10000);

		HttpSession session = httpServletRequest.getSession();// 세션
		if (session != null) {
			session.setAttribute(CommonConstants.TRID_API, trId);

		}
		return trId;
	}

	private Map<String, String> getTypesafeRequestMap(HttpServletRequest request) {
		Map<String, String> typesafeRequestMap = new HashMap<String, String>();
		Enumeration<?> requestParamNames = request.getParameterNames();
		while (requestParamNames.hasMoreElements()) {
			String requestParamName = (String) requestParamNames.nextElement();
			String requestParamValue = request.getParameter(requestParamName);
			typesafeRequestMap.put(requestParamName, requestParamValue);
		}
		return typesafeRequestMap;
	}

	
	public void destroy() {
	}

	private static final class BufferedRequestWrapper extends HttpServletRequestWrapper {

		private ByteArrayInputStream bais = null;
		private ByteArrayOutputStream baos = null;
		private BufferedServletInputStream bsis = null;
		private byte[] buffer = null;

		public BufferedRequestWrapper(HttpServletRequest req) throws IOException {
			super(req);
			// Read InputStream and store its content in a buffer.
			InputStream is = req.getInputStream();
			this.baos = new ByteArrayOutputStream();
			byte buf[] = new byte[1024];
			int letti;
			while ((letti = is.read(buf)) > 0) {
				this.baos.write(buf, 0, letti);
			}
			this.buffer = this.baos.toByteArray();
		}

		
		public ServletInputStream getInputStream() {
			this.bais = new ByteArrayInputStream(this.buffer);
			this.bsis = new BufferedServletInputStream(this.bais);
			return this.bsis;
		}

	}

	private static final class BufferedServletInputStream extends ServletInputStream {

		private ByteArrayInputStream bais;

		public BufferedServletInputStream(ByteArrayInputStream bais) {
			this.bais = bais;
		}

		
		public int available() {
			return this.bais.available();
		}

		
		public int read() {
			return this.bais.read();
		}

		
		public int read(byte[] buf, int off, int len) {
			return this.bais.read(buf, off, len);
		}

	}

	public class TeeServletOutputStream extends ServletOutputStream {

		private final TeeOutputStream targetStream;

		public TeeServletOutputStream(OutputStream one, OutputStream two) {
			targetStream = new TeeOutputStream(one, two);
		}

		
		public void write(int arg0) throws IOException {
			this.targetStream.write(arg0);
		}

		public void flush() throws IOException {
			super.flush();
			this.targetStream.flush();
		}

		public void close() throws IOException {
			super.close();
			this.targetStream.close();
		}

	}

	public class BufferedResponseWrapper implements HttpServletResponse {

		HttpServletResponse original;
		TeeServletOutputStream tee;
		ByteArrayOutputStream bos;

		public BufferedResponseWrapper(HttpServletResponse response) {
			original = response;
		}

		public String getContent() {
			String rlt = "";
			try {
				rlt = bos.toString();
			} catch (Exception e) {
				rlt = "";
			}
			return rlt;
		}

		public PrintWriter getWriter() throws IOException {
			return original.getWriter();
		}

		public ServletOutputStream getOutputStream() throws IOException {
			if (tee == null) {
				bos = new ByteArrayOutputStream();
				tee = new TeeServletOutputStream(original.getOutputStream(), bos);
			}
			return tee;

		}

		
		public String getCharacterEncoding() {
			return original.getCharacterEncoding();
		}

		
		public String getContentType() {
			return original.getContentType();
		}

		
		public void setCharacterEncoding(String charset) {
			original.setCharacterEncoding(charset);
		}

		
		public void setContentLength(int len) {
			original.setContentLength(len);
		}

		
		public void setContentType(String type) {
			original.setContentType(type);
		}

		
		public void setBufferSize(int size) {
			original.setBufferSize(size);
		}

		
		public int getBufferSize() {
			return original.getBufferSize();
		}

		
		public void flushBuffer() throws IOException {
			tee.flush();
		}

		
		public void resetBuffer() {
			original.resetBuffer();
		}

		
		public boolean isCommitted() {
			return original.isCommitted();
		}

		
		public void reset() {
			original.reset();
		}

		
		public void setLocale(Locale loc) {
			original.setLocale(loc);
		}

		
		public Locale getLocale() {
			return original.getLocale();
		}

		
		public void addCookie(Cookie cookie) {
			original.addCookie(cookie);
		}

		
		public boolean containsHeader(String name) {
			return original.containsHeader(name);
		}

		
		public String encodeURL(String url) {
			return original.encodeURL(url);
		}

		
		public String encodeRedirectURL(String url) {
			return original.encodeRedirectURL(url);
		}

		@SuppressWarnings("deprecation")
		
		public String encodeUrl(String url) {
			return original.encodeUrl(url);
		}

		@SuppressWarnings("deprecation")
		
		public String encodeRedirectUrl(String url) {
			return original.encodeRedirectUrl(url);
		}

		
		public void sendError(int sc, String msg) throws IOException {
			original.sendError(sc, msg);
		}

		
		public void sendError(int sc) throws IOException {
			original.sendError(sc);
		}

		
		public void sendRedirect(String location) throws IOException {
			original.sendRedirect(location);
		}

		
		public void setDateHeader(String name, long date) {
			original.setDateHeader(name, date);
		}

		
		public void addDateHeader(String name, long date) {
			original.addDateHeader(name, date);
		}

		
		public void setHeader(String name, String value) {
			original.setHeader(name, value);
		}

		
		public void addHeader(String name, String value) {
			original.addHeader(name, value);
		}

		
		public void setIntHeader(String name, int value) {
			original.setIntHeader(name, value);
		}

		
		public void addIntHeader(String name, int value) {
			original.addIntHeader(name, value);
		}

		
		public void setStatus(int sc) {
			original.setStatus(sc);
		}

		@SuppressWarnings("deprecation")
		
		public void setStatus(int sc, String sm) {
			original.setStatus(sc, sm);
		}

		
		public int getStatus() {
			return 0;
		}

		
		public String getHeader(String name) {
			return null;
		}

		
		public Collection<String> getHeaders(String name) {
			return null;
		}

		
		public Collection<String> getHeaderNames() {
			return null;
		}

	}
}
