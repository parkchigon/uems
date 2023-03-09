package com.flk.mng.commPrice.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.commPrice.domain.CommPrice;

@Repository
public interface CommPriceMapper {

	List<FlkMap> selectCommPriceNmList(CommPrice commPrice);
	List<FlkMap> selectPriceDataList(CommPrice commPrice);
	FlkMap selectPriceDataInfo(CommPrice commPrice); 
	void insertCommPrice(CommPrice commPrice);
	void updateCommPrice(CommPrice commPrice);
	int selectDataCount(CommPrice commPrice);
	void insertCommPriceNm(CommPrice commPrice);
}
