package mes.common.home.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.common.home.service.HomeVO;

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

@Mapper("homeMapper")
public interface HomeMapper {
	
	 public int getOrdVol();
	
	 public int getComVol() throws Exception;
	 public int getBckVol() throws Exception;
	 public int getUsingMac() throws Exception;
	 public int getMonPrice() throws Exception;
	 public int getMonVol() throws Exception;
	 public int getOrdComVol() throws Exception;
	 public int getErrVol() throws Exception;
	 
	 

}
