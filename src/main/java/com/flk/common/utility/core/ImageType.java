package com.flk.common.utility.core;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ikho
 */
public enum ImageType {

	// 상품상세배너
	BANNER_IMAGE {
		@Override
		public List<String> imageSizeList() {
			List<String> imageSizeList = new ArrayList<String>();
			imageSizeList.add("1020x297");
			return imageSizeList;
		}

		@Override
		public int validWidthSize() {
			return 1020;
		}

		@Override
		public int validHeightSize() {
			return 297;
		}

		@Override
		public String imgFormat() {
			return "png";
		}
	}
	// 상품 리스트 이미지
	,
	// 상품상세배너
	PDP_IMAGE {
		@Override
		public List<String> imageSizeList() {
			List<String> imageSizeList = new ArrayList<String>();
			imageSizeList.add("1080x608");
			return imageSizeList;
		}

		@Override
		public int validWidthSize() {
			return 1080;
		}

		@Override
		public int validHeightSize() {
			return 608;
		}

		@Override
		public String imgFormat() {
			return "png";
		}
	}
	// 상품 리스트 이미지
	,
	PLP_IMAGE {
		@Override
		public List<String> imageSizeList() {
			List<String> imageSizeList = new ArrayList<String>();
			imageSizeList.add("960x540");
			return imageSizeList;
		}

		@Override
		public int validWidthSize() {
			return 960;
		}

		@Override
		public int validHeightSize() {
			return 540;
		}

		@Override
		public String imgFormat() {
			return "png";
		}
	};

	/**
	 * <pre>
	 * imageSizeList 사이즈 리스트
	 * 
	 * <pre>
	 * 
	 * @return
	 */
	public abstract List<String> imageSizeList();

	/**
	 * <pre>
	 * validWidthSize 유효성 검사 가로 사이즈
	 * 
	 * <pre>
	 * 
	 * @return
	 */
	public abstract int validWidthSize();

	/**
	 * <pre>
	 * validHeightSize 유효성 검사 세로 사이즈
	 * 
	 * <pre>
	 * 
	 * @return
	 */
	public abstract int validHeightSize();

	/**
	 * <pre>
	 * imgFormat 이미지 format (JPG, PNG 등)
	 * 
	 * <pre>
	 * 
	 * @return
	 */
	public abstract String imgFormat();

}
