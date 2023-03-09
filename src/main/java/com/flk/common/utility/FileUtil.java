package com.flk.common.utility;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.flk.common.domain.Constants;
import com.flk.common.domain.UploadFile;
import com.flk.common.exception.FileDownloadException;

public class FileUtil {

	private static Logger logger =  LoggerFactory.getLogger(FileUtil.class);
	
	/**
	 * multipartFile 저장
	 * @param file
	 * @param filePath
	 * @return
	 * @throws Exception
	 */
	public static UploadFile saveMultipartFile(MultipartFile file, String filePath) throws Exception {
		return saveMultipartFile(file, filePath, "Y");
	}
	public static UploadFile saveMultipartFile(MultipartFile file, String filePath, String uniqueYN) throws Exception {
		UploadFile uploadFile = null;
		
		if(file == null || file.isEmpty()) {
			return null;
		}
		
		try {
			
			//파일명
			String fileName = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf("."));
			//파일확장자
			String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1, file.getOriginalFilename().length());
			
			logger.debug("fine name : " + fileName);
			logger.debug("fine ext : " + fileExt);
			
            Date date = Calendar.getInstance().getTime();
            //유일한 파일명 생성
            if("Y".equals(uniqueYN)) {
				fileName = getFileName();
			}
            
            File dir = new File(filePath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
			
            // 파일 생성
            dir = new File(filePath + fileName + "." + fileExt);
            
            file.transferTo(dir);

            uploadFile = new UploadFile();
            uploadFile.setOrgFileName(file.getOriginalFilename());
            uploadFile.setStoreFileName(fileName);
            uploadFile.setStoreFileExtention(fileExt);
            uploadFile.setFilePath(filePath);
            uploadFile.setFileSize((int) file.getSize() / Constants.BYTE_DIVISION);
            uploadFile.setSaveFile(dir);
            uploadFile.setUploadDate(date);
            
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
        return uploadFile;

	}
	
	/**
	 * 이미지 업로드 + 이미지 resize
	 * @param file
	 * @param filePath
	 * @return
	 * @throws Exception
	 */
	public static UploadFile saveMultipartImage(MultipartFile file, String filePath) throws Exception {
		UploadFile uploadFile = null;
		
		if(file == null || file.isEmpty()) {
			return null;
		}
		
		try {
			
			//파일명
			String fileName = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf("."));
			//파일확장자
			String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1, file.getOriginalFilename().length());
			
			logger.debug("fine name : " + fileName);
			logger.debug("fine ext : " + fileExt);
			
            Date date = Calendar.getInstance().getTime();
            //유일한 파일명 생성
            fileName = getFileName();
            File dir = new File(filePath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
			
            // 파일 생성
            dir = new File(filePath + fileName + "." + fileExt);
            file.transferTo(dir);
            
            //image resize 과정
    		//이미지 사이즈 확인
        	try {
        		String imgPath = filePath + fileName + "." + fileExt;
        		
        		logger.debug("imgPath : " + imgPath);
        		
    			Image image = new ImageIcon(imgPath).getImage();
    			logger.debug("width : " + image.getWidth(null));
    			logger.debug("height : " + image.getHeight(null));
    			
    			imageResize(700, 700, filePath + fileName + "." + fileExt , filePath + fileName+ "_resize" + "." + fileExt);
    			
    			//원본파일삭제
    			if(dir.exists()){
    				dir.delete();
    			}
    			
    			//rename
    			File renameFile = new File(filePath + fileName+ "_resize" + "." + fileExt);
    			if(renameFile.exists()){
    				renameFile.renameTo(dir);
    			}
    			
        	} catch (Exception e) {
        		
        	}

            uploadFile = new UploadFile();
            uploadFile.setOrgFileName(file.getOriginalFilename());
            uploadFile.setStoreFileName(fileName);
            uploadFile.setStoreFileExtention(fileExt);
            uploadFile.setFilePath(filePath);
            uploadFile.setFileSize((int) file.getSize() / Constants.BYTE_DIVISION);
            uploadFile.setSaveFile(dir);
            uploadFile.setUploadDate(date);
            
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
        return uploadFile;

	}
	
	public static void downloadFile(String filePath, String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {

		File targetFile = new File(filePath);
		
		if(targetFile.exists()) {

			String header = getBrowser(request);

			if (header.contains("MSIE")) {
			       String docName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
			       response.setHeader("Content-Disposition", "attachment;filename=" + docName + ";");
			} else if (header.contains("Firefox")) {
			       String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			       response.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");
			} else if (header.contains("Opera")) {
			       String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			       response.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");
			} else if (header.contains("Chrome")) {
			       String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			       response.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");
			}
			response.setContentType("application/x-msdownload");
			
			FileInputStream inStream = null;
			OutputStream outStream = null;
			try {
				inStream = new FileInputStream(targetFile);
				outStream = response.getOutputStream();
				
		        byte[] buffer = new byte[4096];
		        int bytesRead = -1;
		         
		        while ((bytesRead = inStream.read(buffer)) != -1) {
		            outStream.write(buffer, 0, bytesRead);
		        }
		        
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			} finally {
				try {
					inStream.close();
					outStream.close();
				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
			}

		} else {
			throw new FileDownloadException("Report File not exist");
		}
		

	}
	
	public static void deleteFile(String filePath, String fileName) throws Exception {
        File file = new File(filePath + fileName);
        if (file.exists()) {
            file.delete();
        }
	}
    /**
     * 오늘날짜, 시간 가져오기 (Format : YYYYMMDD, HH24MISS) type "D" : 날짜 type "T" : 시간
     * (SECOND) type "F_A" : 양식있는 날짜 + 시간 type "F_MS" : 양식있는 날짜 + 시간
     * (MILLISECOND) type "MS" : 날짜 + 시간 (MILLISECOND) type "M" : 날짜 + 시간
     * (MINUTE) other type : 날짜 + 시간 (SECOND)
     * 
     * @param String
     *            type <code>날짜를 가져올지 시간을 가져올지</code>
     * @return String
     */
    public static String getToDay(String type) {
        Calendar now = Calendar.getInstance();
        String year = null;
        String month = null;
        String day = null;
        String hour = null;
        String minute = null;
        String second = null;
        String millisecond = null;

        year = String.valueOf(now.get(Calendar.YEAR));
        month = String.valueOf((now.get(Calendar.MONTH) + 1));
        day = String.valueOf(now.get(Calendar.DAY_OF_MONTH));
        hour = String.valueOf(now.get(Calendar.HOUR_OF_DAY));
        minute = String.valueOf(now.get(Calendar.MINUTE));
        second = String.valueOf(now.get(Calendar.SECOND));
        millisecond = String.valueOf(now.get(Calendar.MILLISECOND));

        if (month.length() == 1)
            month = "0" + month;
        if (day.length() == 1)
            day = "0" + day;
        if (hour.length() == 1)
            hour = "0" + hour;
        if (minute.length() == 1)
            minute = "0" + minute;
        if (second.length() == 1)
            second = "0" + second;

        if (type.equals("D")) {
            return year + month + day;
        } else if (type.equals("T")) {
            return hour + minute + second;
        } else if (type.equals("F_A")) {
            return year + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second;
        } else if (type.equals("F_MS")) {
            return year + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second + ":" + millisecond;
        } else if (type.equals("MS")) {
            return year + month + day + hour + minute + second + millisecond;
        } else if (type.equals("M")) {
            return year + month + day + hour + minute;
        } else {
            return year + month + day + hour + minute + second;
        }
    }
    
    private static String getBrowser(HttpServletRequest request) {
        String header =request.getHeader("User-Agent");
        if (header.contains("MSIE")) {
               return "MSIE";
        } else if(header.contains("Chrome")) {
               return "Chrome";
        } else if(header.contains("Opera")) {
               return "Opera";
        }
        return "Firefox";
  }
    
    /**
     * 유니크한 파일명
     * @return
     */
	public static String getFileName() {
		String fileName;
		String currentTime = getToDay("MS");
		Random rn = new Random();
		fileName = currentTime + "_" + rn.nextInt(10);
		logger.debug("unique file name : " + fileName);
		return fileName;
	}
	
    
    /**
   	 * 파일경로에서 확장명 get
   	 * 
   	 * @param filePath
   	 * @return
   	 */
   	public static String getExtention(String filePath) {

   		if (filePath == null)
   			return null;

   		int index = filePath.lastIndexOf('.');
   		if (index < 0)
   			return null;

   		return filePath.substring(index + 1);

   	}
   	
   	
   	/**
   	 * 이미지 resize
   	 * @param width
   	 * @param height
   	 * @param orgFilePath
   	 * @param resizeFilePath
   	 * @throws IOException
   	 */
   	public static void imageResize(int width, int height, String orgFilePath, String resizeFilePath ) throws IOException{
		
		File orgfile = new File(orgFilePath);
		
		BufferedImage srcImg = ImageIO.read(orgfile);  // Image를 읽어들임
		int srcWidth = srcImg.getWidth();         
		int srcHeight = srcImg.getHeight();
		
		SimpleImageInfo imageInfo = new SimpleImageInfo(orgfile);
		logger.info("MIME type : " + imageInfo.getMimeType() + " width : " + imageInfo.getWidth() + " height : " + imageInfo.getHeight());
		
		logger.debug("srcWidth : " + srcWidth);
		logger.debug("srcHeight : " + srcHeight);
		
		int destWidth = 0;
		int destHeight = 0;
		
		if(srcWidth > srcHeight){
			int cal = (width * 100 )/ srcWidth;
			destWidth = width;
			destHeight=(int)((srcHeight * cal)/100); // 세로 사이즈 지정
		}else{
			int cal = (height * 100 ) / srcHeight;
			destWidth = (int)((srcWidth * cal)/100);
			destHeight = height;
		}
		logger.debug("destWidth : " + destWidth);
		logger.debug("destHeight : " + destHeight);
		
		Image imgTarget = srcImg.getScaledInstance(destWidth, destHeight, Image.SCALE_SMOOTH); 
		
		
        int pixels[] = new int[destWidth * destHeight]; 
        PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, destWidth, destHeight, pixels, 0, destWidth); 
        try {
            pg.grabPixels();
        } catch (InterruptedException e) {
            throw new IOException(e.getMessage());
        } 
        BufferedImage destImg = new BufferedImage(destWidth, destHeight, srcImg.getType()); 
        destImg.setRGB(0, 0, destWidth, destHeight, pixels, 0, destWidth); 
        
        File destFile =new File(resizeFilePath);

        ImageIO.write(destImg, "png", destFile);
        
		//File Size가 100kb넘으면 이미지 압축 퀄리티 70%로 낮춤
        //이미지 mimeType이 png이면 압축률 조절하면 안됨.(색이 변함)
		if(destFile.length() > 102400 && !"image/png".equals(imageInfo.getMimeType())){
			// reduce quality by 70%  
			ImageIO.write(destImg, "jpg", destFile);
			imageLowQuality(resizeFilePath, 0.7f);
			
		}
	}
   	
	/**
	 * 이미지 압축 퀄리티 조정
	 * @param imgPath 이미지 경로
	 * @param quality 조절 퀄리티 변수 , ex) 0.5f (reduce quality by 50%)
	 * @throws IOException
	 */
	public static void imageLowQuality(String imgPath , float quality) {
		
		FileInputStream inputStream = null;
		FileImageOutputStream output = null;
		
		try {
			inputStream = new FileInputStream(new File(imgPath));
			
			BufferedImage originalImage = ImageIO.read(inputStream);  
			Iterator<ImageWriter> iter = ImageIO.getImageWritersByFormatName("jpeg");  
			ImageWriter writer = (ImageWriter)iter.next();  
			ImageWriteParam iwp = writer.getDefaultWriteParam();  

			iwp.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);  
			
			iwp.setCompressionQuality(quality);  

			File file = new File(imgPath);  
			output = new FileImageOutputStream(file);  
			writer.setOutput(output);  
			  
			IIOImage image = new IIOImage(originalImage, null, null);  
			writer.write(null, image, iwp);  
			writer.dispose(); 
			
		} catch (IOException e) {
			e.printStackTrace();
		}  finally {
			if(inputStream != null){
				try { inputStream.close();} catch (IOException e1) { e1.printStackTrace();}
			}
			if(output != null){
				try { output.close();} catch (IOException e1) {	e1.printStackTrace();}
			}
		}
	}
	
   	
}
