package mes.common.home.service;

import java.util.List;

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
public interface HomeService {
	
	
	int getOrdVol( );
	
	int getComVol( ) throws Exception;
	int getBckVol( ) throws Exception;
	int getUsingMac( ) throws Exception;
	int getMonPrice( ) throws Exception;
	int getMonVol( ) throws Exception;
	int getOrdComVol( ) throws Exception;
	int getErrVol( ) throws Exception;
	
}
