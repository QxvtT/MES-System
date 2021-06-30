package mes.sal.ord.service.impl;

import java.util.List;

import mes.sal.ord.service.OrderMVO;
import mes.sal.ord.service.OrderMDefaultVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * @Class Name : OrderMMapper.java
 * @Description : OrderM Mapper Class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("orderMMapper")
public interface OrderMMapper {

	/**
	 * ORDER_M을 등록한다.
	 * @param vo - 등록할 정보가 담긴 OrderMVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertOrderM(OrderMVO vo) throws Exception;

    /**
	 * ORDER_M을 수정한다.
	 * @param vo - 수정할 정보가 담긴 OrderMVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateOrderM(OrderMVO vo) throws Exception;

    /**
	 * ORDER_M을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 OrderMVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteOrderM(OrderMVO vo) throws Exception;

    /**
	 * ORDER_M을 조회한다.
	 * @param vo - 조회할 정보가 담긴 OrderMVO
	 * @return 조회한 ORDER_M
	 * @exception Exception
	 */
    public OrderMVO selectOrderM(OrderMVO vo) throws Exception;

    /**
	 * ORDER_M 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return ORDER_M 목록
	 * @exception Exception
	 */
    public List<?> selectOrderMList(OrderMDefaultVO searchVO) throws Exception;
    public List<?> OrderNumList(OrderMDefaultVO searchVO) throws Exception;
    
    /**
	 * ORDER_M 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return ORDER_M 총 갯수
	 * @exception
	 */
    public int selectOrderMListTotCnt(OrderMDefaultVO searchVO);
    
    

}
