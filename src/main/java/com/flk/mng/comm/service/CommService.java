package com.flk.mng.comm.service;

import java.util.List;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.comm.domain.Comm;

public interface CommService {

	List<FlkMap> commList(Comm comm) throws Exception;

	FlkMap commDetail(Comm comm) throws Exception;

}
