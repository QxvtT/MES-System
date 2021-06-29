package mes.mat.stc.service;

import java.util.List;

/**
 * @Class Name : MaterialOrderService.java
 * @Description : MaterialOrder Business class
 * @Modification Information
 *
 * @author materialOrder
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface MaterialOrderService {
	
	/**
	 * MATERIAL_ORDER을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialOrderVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertMaterialOrder(MaterialOrderVO vo) throws Exception;
    
    /**
	 * MATERIAL_ORDER을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialOrderVO
	 * @return void형
	 * @exception Exception
	 */
    void updateMaterialOrder(MaterialOrderVO vo) throws Exception;
    
    /**
	 * MATERIAL_ORDER을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialOrderVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteMaterialOrder(MaterialOrderVO vo) throws Exception;
    
    /**
	 * MATERIAL_ORDER을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialOrderVO
	 * @return 조회한 MATERIAL_ORDER
	 * @exception Exception
	 */
    MaterialOrderVO selectMaterialOrder(MaterialOrderVO vo) throws Exception;
    
    /**
	 * MATERIAL_ORDER 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_ORDER 목록
	 * @exception Exception
	 */
    List selectMaterialOrderList(MaterialOrderDefaultVO searchVO) throws Exception;
    
    /**
	 * MATERIAL_ORDER 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_ORDER 총 갯수
	 * @exception
	 */
    int selectMaterialOrderListTotCnt(MaterialOrderDefaultVO searchVO);
    
}
