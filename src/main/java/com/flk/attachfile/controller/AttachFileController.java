package com.flk.attachfile.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flk.attachfile.domain.AttachFile;
import com.flk.attachfile.service.AttachFileService;
import com.flk.common.dataaccess.util.FlkMap;
import com.flk.common.service.ServiceConfig;
import com.flk.common.utility.core.ImageInfoData;
import com.flk.common.utility.core.ImageType;
import com.flk.common.utility.image.ImageHandler;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 
 * 파일 첨부 컨트롤러
 *
 */
@Controller
public class AttachFileController {
	
	private static final Logger log = LoggerFactory.getLogger(AttachFileController.class);
	
    @Value("#{config['flk.nas.path']}")
    private String UPLOAD_BASE_PATH;
    
	@Resource(name = "attachFileService")
	private AttachFileService attachFileService;

	@Resource(name = "fileIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Value("#{config['flk.ip.path']}")
	private String webDomain;	
	
	
	/**
	 * 파일첨부 팝업
	 * 
	 * @param request
	 * @param attachfileVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uems/common/attachfile/attachfilePopup.do")
	public String searchAttachFileView(HttpServletRequest request, @ModelAttribute("attachfileVO") AttachFile attachfileVO,
			ModelMap model) throws Exception {
		return "/common/attachfile/attachfileRegist";
	}

	/**
	 * 파일첨부 리스트 조회
	 * 
	 * @param request
	 * @param response
	 * @param attachfileVO
	 * @throws Exception
	 */
	@RequestMapping("/uems/common/attachfile/attachfileList.do")
	public void searchAttachfileList(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("attachfileVO") AttachFile attachfileVO) throws Exception {
		
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		
		PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));
		List<FlkMap> list = attachFileService.searchAttachFileList(attachfileVO);

		JSONArray inner = new JSONArray();
		
		for (FlkMap map : list) {
			JSONObject obj = new JSONObject();
			obj.put("fileId", map.get("fileId").toString());
			obj.put("fileName", map.get("fileName").toString());
			obj.put("fileExtension", map.get("fileExtension").toString());
			obj.put("filePhysicalPath", map.get("filePhysicalPath").toString());
			obj.put("fileRealPath", map.get("fileRealPath").toString());
			obj.put("fileReferenceId", map.get("fileReferenceId").toString());
			obj.put("fileGroup", map.get("fileGroup").toString());
			obj.put("regId", map.get("regId").toString());
			obj.put("fileSize", map.get("fileSize").toString());
			obj.put("delegateYn", map.get("delegateYn").toString());
			/**서버세팅*/
			obj.put("domainPath", webDomain);
			
			inner.add(obj);
		}
		out.print(inner);
		out.flush();
		out.close();
	}

	/**
	 * 파일 등록
	 * 
	 * @param multiRequest
	 * @param attachfileVO
	 * @param response
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping("/uems/common/attachfile/attachfileRegistExe.do")
	public void addAttachfile(final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("attachfileVO") AttachFile attachfileVO, HttpServletResponse response, Model model)
					throws Exception {
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));

		String resultMsg = "";
		MultipartHttpServletRequest multipartRequest = multiRequest;

		MultipartFile filedate = multipartRequest.getFile("Filedata");

		String DIR_UPLOAD = UPLOAD_BASE_PATH;
		
		String filePath = attachfileVO.getFolder();
		
		String fileRealPath = DIR_UPLOAD + filePath;

		File f = new File(fileRealPath);
		
		if (!f.exists()) {
			f.mkdirs(); // 디렉토리 생성
		}

		attachfileVO.setFileName(filedate.getOriginalFilename());

		int dotPoint = filedate.getOriginalFilename().lastIndexOf(".");
		String ext = "";
		if (dotPoint > -1){
			ext = filedate.getOriginalFilename().substring(dotPoint + 1);
		}
		
		String fileId = egovIdGnrService.getNextStringId();
		attachfileVO.setFileId(fileId);
		attachfileVO.setFileExtension(ext);
		attachfileVO.setFileSize(Long.toString(filedate.getSize()));
		
		String reFileNm = fileId + "." + attachfileVO.getFileExtension();
		
		String orgFilePath = filePath + reFileNm;
		fileRealPath = fileRealPath + reFileNm;
		
		attachfileVO.setFilePhysicalPath(orgFilePath);
		attachfileVO.setFileRealPath(fileRealPath);
		attachfileVO.setFileOrgPath(attachfileVO.getFilePhysicalPath());
		
		filedate.transferTo(new File(fileRealPath));
		
		/**
		 * 이미지 리사이징
		 */
		if(attachfileVO.getFileGroup().indexOf("file") > -1){

			ImageHandler handler = new ImageHandler();
			ImageInfoData data = new ImageInfoData();
			data.setImageType(ImageType.PDP_IMAGE);
			data.setOrgImgPath(fileRealPath);
			boolean isSucess = handler.job(data);
			
			if(isSucess){
				int idx = orgFilePath.lastIndexOf(".");
				String destFilePrefix = orgFilePath.substring(0, idx);
				
				attachfileVO.setFileRealPath(DIR_UPLOAD+destFilePrefix+ImageType.PDP_IMAGE.imageSizeList().get(0)+"." + ImageType.PDP_IMAGE.imgFormat());
				attachfileVO.setFilePhysicalPath(destFilePrefix+ImageType.PDP_IMAGE.imageSizeList().get(0)+"." + ImageType.PDP_IMAGE.imgFormat());	
			}
			
		}else if(attachfileVO.getFileGroup().equals("listImage")){

			ImageHandler handler = new ImageHandler();
			ImageInfoData data = new ImageInfoData();
			data.setImageType(ImageType.PLP_IMAGE);
			data.setOrgImgPath(fileRealPath);
			boolean isSucess = handler.job(data);
			
			if(isSucess){
				int idx = orgFilePath.lastIndexOf(".");
				String destFilePrefix = orgFilePath.substring(0, idx);
				
				attachfileVO.setFileRealPath(DIR_UPLOAD+destFilePrefix+ImageType.PLP_IMAGE.imageSizeList().get(0)+"." + ImageType.PLP_IMAGE.imgFormat());
				attachfileVO.setFilePhysicalPath(destFilePrefix+ImageType.PLP_IMAGE.imageSizeList().get(0)+"." + ImageType.PLP_IMAGE.imgFormat());	
			}
		
		}
		
		attachfileVO.setRegId((String) multiRequest.getSession().getAttribute(ServiceConfig.SESSION_KEY_USER_ID));
		attachFileService.addAttachFile(attachfileVO);
		
		resultMsg = "정상적으로 업로드 하였습니다.";
		resultMsg += "\n저장된 파일 => " + fileRealPath;
		log.debug("FILE Regist : " + resultMsg);
		
		model.addAttribute("fileId", fileId);
		model.addAttribute("fileSize", attachfileVO.getFileSize());
		
		model.addAttribute("resultMsg", "success.common.insert");
		out.println(fileId);

		out.flush();
	}
	/**
	 * 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다.
	 *
	 * @param attachfileVO
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/uems/common/attachfile/fileDown.do")
	public void searchCvplFileDownload(HttpServletRequest request,
			@ModelAttribute("attachfileVO") AttachFile attachfileVO, HttpServletResponse response) throws Exception {

		FlkMap fvo = attachFileService.searchAttachFileView(attachfileVO);

		if (fvo == null) {
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Type", "text/html; charset=UTF-8");

			PrintWriter printwriter = response.getWriter();
			printwriter.println(
					"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">");
			printwriter.println("<html xmlns=\"http://www.w3.org/1999/xhtml\">");
			printwriter.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
			printwriter.println("<script type=\"text/javascript\">");
			printwriter.println("alert('파일이 존재하지 않습니다.');");
			printwriter.println("history.back();");
			printwriter.println("</script>");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
			return;
		}

		File uFile = new File(fvo.get("fileRealPath").toString());
		int fSize = (int) uFile.length();

		if (fSize > 0) {

			/***
			 * 파일 첨부만 다운로드 체크 한다.
			 */
			if (fvo.get("fileGroup").toString().equals("file1")) {
				/** 파일다운 카운트 증가 */
				attachFileService.modifyAttachFileDownCnt(attachfileVO);
			}
			String mimetype = "application/x-msdownload";

			response.setBufferSize(fSize);
			response.setContentType(mimetype);
			setDisposition(fvo.get("fileName").toString(), request, response);
			response.setContentLength(fSize);

			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			byte[] buffer = new byte[4096];

			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());

				int bytesRead = -1;
				while ((bytesRead = in.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
					out.flush();
				}
				out.flush();
			} catch (Exception ex) {
				log.debug("IGNORED: " + ex.getMessage());
			} finally {
				try {
					if (in != null) {
						in.close();
					}
				} catch (Exception ignore) {
					// no-op
					log.debug("IGNORED: " + ignore.getMessage());
				}
				try {
					if (out != null) {
						out.close();
					}
				} catch (Exception ignore) {
					// no-op
					log.debug("IGNORED: " + ignore.getMessage());
				}
			}
		}

	}


	/**
	 * Disposition 지정하기.
	 *
	 * @param filename
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void setDisposition(String fnm, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String filename = fnm;
		
		String strClient = request.getHeader("user-agent");
		filename = new String(filename.getBytes("KSC5601"), "8859_1");
		filename = filename.replaceAll(" ", "_").replaceAll(";", "_");

		if (strClient.indexOf("MSIE 5.5") != -1) {
			response.setHeader("Content-Type", "doesn/matter;");
			response.setHeader("Content-Disposition", "filename=" + filename + ";");
		} else if (strClient.indexOf("MSIE 6.0") != -1) {
			response.setHeader("Content-Type", "application/octet-stream;");
			response.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
		} else {
			response.setHeader("Content-Type", "application/octet-stream;");
			response.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
		}

	}

}
