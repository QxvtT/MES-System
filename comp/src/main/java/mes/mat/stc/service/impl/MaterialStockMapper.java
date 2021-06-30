package mes.mat.stc.service.impl;

import java.util.List;

import mes.mat.stc.service.MaterialStockVO;
import mes.mat.stc.service.MaterialStockDefaultVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * @Class Name : MaterialStockMapper.java
 * @Description : MaterialStock Mapper Class
 * @Modification Information
 *
 * @author materialStock
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("materialStockMapper")
public interface MaterialStockMapper {

	/**
	 * MATERIAL_STOCK을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialStockVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertMaterialStock(MaterialStockVO vo) throws Exception;

    /**
	 * MATERIAL_STOCK을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialStockVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMaterialStock(MaterialStockVO vo) throws Exception;

    /**
	 * MATERIAL_STOCK을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialStockVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMaterialStock(MaterialStockVO vo) throws Exception;

    /**
	 * MATERIAL_STOCK을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialStockVO
	 * @return 조회한 MATERIAL_STOCK
	 * @exception Exception
	 */
    public MaterialStockVO selectMaterialStock(MaterialStockVO vo) throws Exception;

    /**
	 * MATERIAL_STOCK 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return MATERIAL_STOCK 목록
	 * @exception Exception
	 */
    public List<?> selectMatStcList(MaterialStockVO searchVO) throws Exception; // 자재 재고 조회

    /**
	 * MATERIAL_STOCK 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return MATERIAL_STOCK 총 갯수
	 * @exception
	 */
    
    public List<?> selectMatLotStcList(MaterialStockVO searchVO) throws Exception; // 자재 LOT 재고 조회
    
    public List<?> selectMatCodeList(MaterialStockVO searchVO) throws Exception; // 자재 코드 조회
    
    public int selectMaterialStockListTotCnt(MaterialStockDefaultVO searchVO);

}
