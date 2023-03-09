package com.flk.mng.equipment.mapper;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.equipment.domain.CTower;


@Repository
public interface CTowerMapper {

	/**냉각탑 리스트 조회
	 * @param cTower
	 * @return
	 */
	List<FlkMap> selectCTowerList(CTower cTower);

	/**냉각탑 상세 Master
	 * @param cTower
	 * @throws Exception
	 */
	FlkMap selectCTowerInfo(CTower cTower);

	/**냉각탑 상세 SUB
	 * @param cTower
	 * @throws Exception
	 */
	List<FlkMap> selectSubCTowerList(CTower cTower);

	/**냉각탑 등록 Master
	 * @param cTower
	 * @throws Exception
	 */
	void insertCTowerMaster(CTower cTower);

	/**냉각탑 등록 SUB
	 * @param cTower
	 * @throws Exception
	 */
	void insertCTowerSub(CTower subCTower);

	/**냉각탑 수정 Master
	 * @param cTower
	 * @throws Exception
	 */
	void updateCTowerMaster(CTower cTower);

	/**냉각탑 수정 SUB
	 * @param cTower
	 * @throws Exception
	 */
	void updateUseFlag(CTower cTower);

	/**냉각탑 삭제 SUB
	 * @param cTower
	 * @throws Exception
	 */
	void deleteCTowerSub(CTower cTower);
	
}
