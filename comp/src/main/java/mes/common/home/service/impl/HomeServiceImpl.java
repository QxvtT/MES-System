package mes.common.home.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.common.home.service.HomeService;
import mes.common.home.service.HomeVO;
import mes.sal.out.service.ItemHistoryVO;

/**
 * @Class Name : OperationServiceImpl.java
 * @Description : Operation Business Implement class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *      Copyright (C) All right reserved.
 */

@Service("homeService")
public class HomeServiceImpl extends EgovAbstractServiceImpl implements HomeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HomeServiceImpl.class);

	@Resource(name = "homeMapper")
	private HomeMapper menuDAO;
	
	public int getOrdVol( ) { 
		return menuDAO.getOrdVol();
	}
	
	public int getComVol( ) throws Exception {
		return menuDAO.getComVol(); 
	}
	public int getBckVol( ) throws Exception {
		return menuDAO.getBckVol(); 
	}
	
	public int getUsingMac( ) throws Exception {
		return menuDAO.getUsingMac(); 
	}
	public int getMonPrice( ) throws Exception {
		return menuDAO.getMonPrice(); 
	}
	public int getMonVol( ) throws Exception {
		return menuDAO.getMonVol(); 
	}
	public int getOrdComVol( ) throws Exception {
		return menuDAO.getOrdComVol(); 
	}
	public int getErrVol( ) throws Exception {
		return menuDAO.getErrVol(); 
	}
	
	

 
	



	

}
