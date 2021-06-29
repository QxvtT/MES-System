package mes.mat.stc.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.mat.stc.service.MaterialOrderDefaultVO;
import mes.mat.stc.service.MaterialOrderVO;

/**
 * @Class Name : MaterialOrderMapper.java
 * @Description : MaterialOrder Mapper Class
 * @Modification Information
 *
 * @author materialOrder
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("materialOrderMapper")
public interface MaterialOrderMapper {

	/**
	 * MATERIAL_ORDER을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialOrderVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertMaterialOrder(MaterialOrderVO vo) throws Exception;

    /**
	 * MATERIAL_ORDER을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialOrderVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMaterialOrder(MaterialOrderVO vo) throws Exception;

    /**
	 * MATERIAL_ORDER을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialOrderVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMaterialOrder(MaterialOrderVO vo) throws Exception;

    /**
	 * MATERIAL_ORDER을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialOrderVO
	 * @return 조회한 MATERIAL_ORDER
	 * @exception Exception
	 */
    public MaterialOrderVO selectMaterialOrder(MaterialOrderVO vo) throws Exception;

    /**
	 * MATERIAL_ORDER 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return MATERIAL_ORDER 목록
	 * @exception Exception
	 */
    public List<?> selectMaterialOrderList(MaterialOrderDefaultVO searchVO) throws Exception;

    /**
	 * MATERIAL_ORDER 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return MATERIAL_ORDER 총 갯수
	 * @exception
	 */
    public int selectMaterialOrderListTotCnt(MaterialOrderDefaultVO searchVO);

}
