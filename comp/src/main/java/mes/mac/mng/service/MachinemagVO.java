package mes.mac.mng.service;

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
    
    /** MAC_NAME */
    private java.lang.String macName;
    
    /** MAC_DIV */
    private java.lang.String macDiv;
    
    /** MAC_SIZE */
    private java.lang.String macSize;
    
    /** MODEL */
    private java.lang.String model;
    
    /** PRO_OPER */
    private java.lang.String proOper;
    
    /** WORKER */
    private java.lang.String worker;
    
    /** USE */
    private java.lang.String use;
    
    /** NOM_CAP */
    private java.lang.String nomCap;
    
    /** USING_ENERGY */
    private java.lang.String usingEnergy;
    
    /** SAFETY */
    private java.lang.String safety;
    
    /** MAC_PRO_DATE */
    private java.sql.Date macProDate;
    
    /** BUY_DATE */
    private java.sql.Date buyDate;
    
    /** BUY_PRICE */
    private java.math.BigDecimal buyPrice;
    
    /** LINE_NUM */
    private java.math.BigDecimal lineNum;
    
    /** MAC_LOADAGE */
    private java.math.BigDecimal macLoadage;
    
    /** MAC_STD_TEMP */
    private java.math.BigDecimal macStdTemp;
    
   
    
}
