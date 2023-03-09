package com.flk.mng.commPrice.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.commPrice.domain.CommPrice;

public interface CommPriceService {
	List<FlkMap> searchCommPriceNmList(CommPrice commPrice) throws Exception;
	List<FlkMap> searchPriceDataList(CommPrice commPrice) throws Exception;
	FlkMap searchPriceDataInfo(CommPrice commPrice)throws Exception;
	void addCommPrice(CommPrice commPrice)throws Exception;
	void modifyCommPrice(CommPrice commPrice)throws Exception;
	int searchDataCount(CommPrice commPrice) throws Exception;
	void addCommPriceNm(CommPrice commPrice) throws Exception;
}
