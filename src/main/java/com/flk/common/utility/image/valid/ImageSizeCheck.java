package com.flk.common.utility.image.valid;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.flk.common.utility.core.ImageInfoData;
import com.flk.common.utility.core.ImageValid;

/**
 * 
 * @author ikho
 * @프로그램설명 : 이미지 사이즈 체크
 */
public class ImageSizeCheck implements ImageValid {

	/**
	 * 이미지 사이즈 체크
	 */
	@Override
	public boolean valid(ImageInfoData data) throws IOException {
		String orgImgPath = data.getOrgImgPath();
		BufferedImage originalImage = ImageIO.read(new File(orgImgPath));
		int originWidth = originalImage.getWidth();
		int originHeight = originalImage.getHeight();

		// validation width, height 정보
		int validWidth = data.getImageType().validWidthSize();
		int validHeight = data.getImageType().validHeightSize();

		// validation check
		if (originWidth == validWidth && originHeight == validHeight) {
			return false;
		}

		return true;
	}
}
