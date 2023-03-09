package com.flk.mng.commPrice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.commPrice.domain.CommPrice;
import com.flk.mng.commPrice.mapper.CommPriceMapper;

@Service
public class CommPriceServiceImpl implements CommPriceService {
	@Autowired CommPriceMapper commPriceMapper;
	
	@Override
	public List<FlkMap> searchCommPriceNmList(CommPrice commPrice) throws Exception{
		return commPriceMapper.selectCommPriceNmList(commPrice);
	}
	
	@Override
	public List<FlkMap> searchPriceDataList(CommPrice commPrice) throws Exception{
		return commPriceMapper.selectPriceDataList(commPrice);
	}
	
	@Override
	public FlkMap searchPriceDataInfo(CommPrice commPrice) throws Exception{
		return commPriceMapper.selectPriceDataInfo(commPrice);
	}
	
	@Override
	public void addCommPrice(CommPrice commPrice) throws Exception{
		 commPriceMapper.insertCommPrice(commPrice);
	}
	
	@Override
	public void modifyCommPrice(CommPrice commPrice) throws Exception{
		 commPriceMapper.updateCommPrice(commPrice);
	}
	
	@Override
	public int searchDataCount(CommPrice commPrice) throws Exception {
		return commPriceMapper.selectDataCount(commPrice);
	}
	@Override
	public void addCommPriceNm(CommPrice commPrice) throws Exception {
		commPriceMapper.insertCommPriceNm(commPrice);
	}
	
}
