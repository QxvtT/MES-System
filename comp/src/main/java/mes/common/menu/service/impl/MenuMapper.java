package mes.common.menu.service.impl;

import java.util.List;

import egovframework.com.cmm.LoginVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.common.modal.service.EmployeesVO;
import mes.common.modal.service.ItemVO;
import mes.common.modal.service.MachineVO;
import mes.common.modal.service.MaterialVO;
import mes.common.modal.service.OperationDefaultVO;
import mes.common.modal.service.OperationVO;
import mes.common.modal.service.ProcessVO;

/**
 * @Class Name : OperationMapper.java
 * @Description : Operation Mapper Class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 * 
 *      Copyright (C) All right reserved.
 */

@Mapper("menuMapper")
public interface MenuMapper {


	public List<?> selectMenuList(LoginVO vo) throws Exception;


}
