package mes.sal.ord.service;

import java.sql.Date;
import java.util.List;

/**
 * @Class Name : OrderMService.java
 * @Description : OrderM Business class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface OrderMService {
	
	/**
	 * ORDER_M을 등록한다.
	 * @param vo - 등록할 정보가 담긴 OrderMVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertOrderM(OrderMVO vo) throws Exception;
    
    /**
	 * ORDER_M을 수정한다.
	 * @param vo - 수정할 정보가 담긴 OrderMVO
	 * @return void형
	 * @exception Exception
	 */
    void updateOrderM(OrderMVO vo) throws Exception;
    
    /**
	 * ORDER_M을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 OrderMVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteOrderM(OrderMVO vo) throws Exception;
    
    /**
	 * ORDER_M을 조회한다.
	 * @param vo - 조회할 정보가 담긴 OrderMVO
	 * @return 조회한 ORDER_M
	 * @exception Exception
	 */
    OrderMVO selectOrderM(OrderMVO vo) throws Exception;
    
    /**
	 * ORDER_M 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return ORDER_M 목록
	 * @exception Exception
	 */
    List selectOrderMList(OrderMVO searchVO) throws Exception;
    List OrderNumList(OrderMVO searchVO) throws Exception;
    
    
    /**
	 * ORDER_M 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return ORDER_M 총 갯수
	 * @exception
	 */
    int selectOrderMListTotCnt(OrderMDefaultVO searchVO);
    
}
