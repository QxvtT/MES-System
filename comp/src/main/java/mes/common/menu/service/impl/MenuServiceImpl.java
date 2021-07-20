package mes.common.menu.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.LoginVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.common.menu.service.MenuService;

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

@Service("menuService")
public class MenuServiceImpl extends EgovAbstractServiceImpl implements MenuService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MenuServiceImpl.class);

	@Resource(name = "menuMapper")
	private MenuMapper menuDAO;

	// @Resource(name="operationDAO")
	// private OperationDAO operationDAO;

	/** ID Generation */
	// @Resource(name="{egovOperationIdGnrService}")
	// private EgovIdGnrService egovIdGnrService;

	public List<?> selectMenuList(LoginVO vo) throws Exception {
		List<?> resultVO = menuDAO.selectMenuList(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	

}
