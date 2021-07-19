package mes.common.modal.service;

import lombok.Data;

/**
 * @Class Name : OperationVO.java
 * @Description : Operation VO class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 * 
 *      Copyright (C) All right reserved.
 */

@Data
public class MachineVO extends OperationDefaultVO {
	private static final long serialVersionUID = 1L;

	// 설비검색

	/** MAC_CODE */
	private java.lang.String macCode;

	/** MAC_NAME */
	private java.lang.String macName;

	/** MAC_DIV */
	private java.lang.String macDiv;

	/** MAC_SIZE */
	private java.lang.String use1;

	/** MODEL */
	private java.lang.String model;

	/** PRO_OPER */
	private java.lang.String proOper;

	/** WORKER */
	private java.lang.String worker;

	/** USE */
	private java.lang.String use;

	/** USING_ENERGY */
	private java.lang.String usingEnergy;

	/** BUY_DATE */
	private java.lang.String buyDate1;

	/** BUY_PRICE */
	private java.math.BigDecimal buyPrice;

	/** MAC_LOADAGE */
	private java.math.BigDecimal macLoadage;

	/** MAC_STD_TEMP */
	private java.math.BigDecimal macStdTemp;

	// 사용가능한 설비명 검색
	private java.lang.String prcResDNum;
	
	// 사용가능한 설비명 검색
	private java.lang.String prcCode;
	
	// 사용가능한 설비명 검색
	private java.lang.String prcName;

	// 스크롤용
	private java.lang.String macCode1;

}
