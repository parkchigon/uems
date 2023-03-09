package com.flk.common.utility.image.valid;

import java.io.File;

import com.flk.common.utility.core.ImageInfoData;
import com.flk.common.utility.core.ImageValid;

import net.sf.jmimemagic.Magic;
import net.sf.jmimemagic.MagicMatch;

/**
 * 
 * @author ikho
 *
 */
public class ImageMimeTypeCheck implements ImageValid {

	/**
	 * mimeType 체크
	 */
	@Override
	public boolean valid(ImageInfoData data) throws Exception {
		// 원본 이미지 path
		String orgImgPath = data.getOrgImgPath();

		// mimeType 추출
		MagicMatch match = Magic.getMagicMatch(new File(orgImgPath), true);
		String mimeType = match.getMimeType();

		// image format 추출
		String format = makeFormat(data);

		// mimeType 같으면 성공
		if (mimeType.equals(format)) {
			return true;
		}

		return false;
	}

	/**
	 * <pre>
	 * makeFormat
	 *
	 * <pre>
	 * 
	 * @param data
	 * @return
	 */
	private String makeFormat(ImageInfoData data) {
		String format = data.getImageType().imgFormat();
		StringBuilder formatBuf = new StringBuilder();
		formatBuf.append("image/");
		formatBuf.append(format);

		return formatBuf.toString();
	}

}
