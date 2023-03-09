package com.flk.common.utility.core;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

/**
 * 
 * @author ikho
 *
 */
public class ImageResizer {

	/** 원본 이미지 객체 */
	private final BufferedImage originalImage;
	/** 원본 이미지 path */
	private final String orgImgPath;
	/** image type enum */
	private final ImageType imageType;

	/**
	 * constructor
	 * 
	 * @throws IOException
	 */
	public ImageResizer(ImageInfoData data) throws IOException {
		orgImgPath = data.getOrgImgPath();
		imageType = data.getImageType();
		originalImage = ImageIO.read(new File(orgImgPath));
	}

	/**
	 * <pre>
	 * process 이미지 resize process
	 * 
	 * <pre>
	 * 
	 * @param data
	 * @throws IOException
	 */
	public void process() throws Exception {

		int type = getImgType();
		String imgFormat = imageType.imgFormat();
		List<String> imgSizeList = imageType.imageSizeList();

		for (String size : imgSizeList) {
			// 가로, 세로 사이즈 추출
			Map<String, Integer> sizeMap = getSize(size);
			int width = sizeMap.get("width");
			int height = sizeMap.get("height");

			// 이미지 리사이즈
			BufferedImage resizeImage = resizeImageHighQuality(type, width, height);

			// 이미지 파일 생성
			String destResizeImgFilePath = makeDestImgFilePath(size);
			File destFile = new File(destResizeImgFilePath);
			ImageIO.write(resizeImage, imgFormat, destFile);
		}
	}

	/**
	 * <pre>
	 * resizeImageHighQuality 이미지 리사이즈 (원본 품질 유지) getScaledInstance 함수를 통해 이미지
	 * 크기 변환을 하면 변환된 이미지의 품질이 떨어지지 않는다. Image.SCALE_SMOOTH를 이용하면 새롭게 생성된 이미지의
	 * 품질이 떨어지지 않게 된다.
	 * 
	 * <pre>
	 * 
	 * @param type
	 * @param width
	 * @param height
	 * @return
	 * @throws Exception
	 */
	private BufferedImage resizeImageHighQuality(int type, int width, int height) throws Exception {
		Image image = originalImage.getScaledInstance(width, height, Image.SCALE_SMOOTH);
		int pixels[] = new int[width * height];
		PixelGrabber pixelGrabber = new PixelGrabber(image, 0, 0, width, height, pixels, 0, width);
		pixelGrabber.grabPixels();

		// image 객체로부터 픽셀 정보를 읽어온 후, BufferedImage에 채워 넣어주면 이미지 크기 변환이 된다.
		BufferedImage destImg = new BufferedImage(width, height, type);
		destImg.setRGB(0, 0, width, height, pixels, 0, width);

		return destImg;
	}

	/**
	 * <pre>
	 * getSize 가로, 세로 데이터 추출
	 * 
	 * <pre>
	 * 
	 * @param size
	 * @return
	 */
	private Map<String, Integer> getSize(String size) {
		Map<String, Integer> sizeMap = new HashMap<String, Integer>();
		String[] sizeArr = size.split("x");

		String widthStr = sizeArr[0];
		String heightStr = sizeArr[1];
		int width = Integer.parseInt(widthStr);
		int height = Integer.parseInt(heightStr);

		sizeMap.put("width", width);
		sizeMap.put("height", height);

		return sizeMap;
	}

	/**
	 * <pre>
	 * getImgType BufferedImage.TYPE_INT_RGB 이면, 배경색이 검정
	 * BufferedImage.TYPE_INT_ARGB 이면, 배경색이 투명
	 * 
	 * <pre>
	 * 
	 * @return
	 */
	private int getImgType() {
		int imtType = 0;
		int originalImgType = originalImage.getType(); // 원본 이미지 type
		if (originalImgType == 0) {
			imtType = BufferedImage.TYPE_INT_ARGB;
		} else {
			imtType = originalImgType;
		}
		return imtType;
	}

	/**
	 * <pre>
	 * getDestImgFilePath resize 이미지 path 생성
	 * 
	 * <pre>
	 * 
	 * @param orgImgPath
	 * @param imgFormat
	 * @param size
	 */
	private String makeDestImgFilePath(String size) {
		String imgFormat = imageType.imgFormat();

		int idx = orgImgPath.lastIndexOf(".");
		String destFilePrefix = orgImgPath.substring(0, idx);

		StringBuilder destFilePathBuf = new StringBuilder();
		destFilePathBuf.append(destFilePrefix);
		destFilePathBuf.append(size);
		destFilePathBuf.append(".");
		destFilePathBuf.append(imgFormat);

		return destFilePathBuf.toString();
	}
}
