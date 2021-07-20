package mes.common.menu.service;

import java.util.List;
import egovframework.com.cmm.LoginVO;

/**
 * @Class Name : OperationService.java
 * @Description : Operation Business class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface MenuService {
	
	List<?> selectMenuList(LoginVO vo) throws Exception;
    
    //List selectMenuList(LoginVO searchVO) throws Exception;

}
