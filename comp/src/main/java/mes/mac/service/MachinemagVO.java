package mes.mac.service;

import lombok.Data;

/**
 * @Class Name : MachineVO.java
 * @Description : Machine VO class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-07-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Data
public class MachinemagVO extends MachinemagDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** MAC_CODE */
    private java.lang.String macCode;
    
    /** PRC_CODE */
    private java.lang.String prcCode;
    
    /** PRC_Name */
    private java.lang.String prcName;
    
    /** MAC_NAME */
    private java.lang.String macName;
    
    private java.lang.String empName;
    
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
    private java.lang.String buyDate;
    private java.lang.String buyDate1;
    
    /** BUY_PRICE */
    private java.math.BigDecimal buyPrice;

    /** MAC_LOADAGE */
    private java.math.BigDecimal macLoadage;
    
    /** MAC_STD_TEMP */
    private java.math.BigDecimal macStdTemp;
    
    /** IMAGE_PATH */
    private java.lang.String imagePath;
    
   
    
}
