package mes.sal.ord.service.impl;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.sal.ord.service.OrderMDefaultVO;
import mes.sal.ord.service.OrderMService;
import mes.sal.ord.service.OrderMVO;
/**
 * @Class Name : OrderMServiceImpl.java
 * @Description : OrderM Business Implement class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("orderMService")
public class OrderMServiceImpl extends EgovAbstractServiceImpl implements
        OrderMService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(OrderMServiceImpl.class);

    @Resource(name="orderMMapper")
    private OrderMMapper orderMDAO;
    
    //@Resource(name="orderMDAO")
    //private OrderMDAO orderMDAO;
    
    /** ID Generation */
    //@Resource(name="{egovOrderMIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * ORDER_M을 등록한다.
	 * @param vo - 등록할 정보가 담긴 OrderMVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertOrderM(OrderMVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	orderMDAO.insertOrderM(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * ORDER_M을 수정한다.
	 * @param vo - 수정할 정보가 담긴 OrderMVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateOrderM(OrderMVO vo) throws Exception {
        orderMDAO.updateOrderM(vo);
    }

    /**
	 * ORDER_M을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 OrderMVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteOrderM(OrderMVO vo) throws Exception {
        orderMDAO.deleteOrderM(vo);
    }

    /**
	 * ORDER_M을 조회한다.
	 * @param vo - 조회할 정보가 담긴 OrderMVO
	 * @return 조회한 ORDER_M
	 * @exception Exception
	 */
    public OrderMVO selectOrderM(OrderMVO vo) throws Exception {
        OrderMVO resultVO = orderMDAO.selectOrderM(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * ORDER_M 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return ORDER_M 목록
	 * @exception Exception
	 */
    public List<?> selectOrderMList(OrderMVO searchVO) throws Exception {
        return orderMDAO.selectOrderMList(searchVO);
    }

    /**
	 * ORDER_M 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return ORDER_M 총 갯수
	 * @exception
	 */
    public int selectOrderMListTotCnt(OrderMDefaultVO searchVO) {
		return orderMDAO.selectOrderMListTotCnt(searchVO);
	}

    
}
