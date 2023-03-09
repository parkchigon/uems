package com.flk.common.utility.image;

import java.util.ArrayList;
import java.util.List;

import com.flk.common.utility.core.ImageInfoData;
import com.flk.common.utility.core.ImageResizer;
import com.flk.common.utility.core.ImageValid;
import com.flk.common.utility.image.valid.ImageSizeCheck;

/***
 * 
 * @author ikho
 *
 */
public class ImageHandler {

	/** validation check list */
	private final List<ImageValid> validCheckList;

	/**
	 * constructor
	 */
	public ImageHandler() {
		validCheckList = new ArrayList<ImageValid>();
		validCheckList.add(new ImageSizeCheck());
	}

	/**
	 * <pre>
	 * job 이미지 resize handle
	 * 
	 * <pre>
	 * 
	 * @param data
	 * @return
	 */
	public boolean job(ImageInfoData data) {
		boolean isSuccess = false;
		try {
			for (ImageValid imageValid : validCheckList) {
				isSuccess = imageValid.valid(data);

				// validation check 실패의 경우
				if (isSuccess == false) {
					return false;
				}
			}

			// 이미지 resize
			ImageResizer resizer = new ImageResizer(data);
			resizer.process();

		} catch (Exception ex) {
			isSuccess = false;
		}

		return isSuccess;
	}
}
