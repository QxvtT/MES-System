package mes.prd.pln.service.impl;

import java.util.List;

import mes.prd.pln.service.ProducePlanDVO;
import mes.prd.pln.service.ProducePlanDDefaultVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * @Class Name : ProducePlanDMapper.java
 * @Description : ProducePlanD Mapper Class
 * @Modification Information
 *
 * @author Jeoung
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("producePlanDMapper")
public interface ProducePlanDMapper {

	/**
	 * PRODUCE_PLAN_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProducePlanDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertProducePlanD(ProducePlanDVO vo) throws Exception;

    /**
	 * PRODUCE_PLAN_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProducePlanDVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateProducePlanD(ProducePlanDVO vo) throws Exception;

    /**
	 * PRODUCE_PLAN_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProducePlanDVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteProducePlanD(ProducePlanDVO vo) throws Exception;

    /**
	 * PRODUCE_PLAN_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProducePlanDVO
	 * @return 조회한 PRODUCE_PLAN_D
	 * @exception Exception
	 */
    public ProducePlanDVO selectProducePlanD(ProducePlanDVO vo) throws Exception;

    /**
	 * PRODUCE_PLAN_D 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return PRODUCE_PLAN_D 목록
	 * @exception Exception
	 */
    public List<?> selectProducePlanDList(ProducePlanDDefaultVO searchVO) throws Exception;

    /**
	 * PRODUCE_PLAN_D 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return PRODUCE_PLAN_D 총 갯수
	 * @exception
	 */
    public int selectProducePlanDListTotCnt(ProducePlanDDefaultVO searchVO);

}
