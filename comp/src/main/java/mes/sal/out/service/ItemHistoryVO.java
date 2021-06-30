package mes.sal.out.service;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Class Name : ItemHistoryVO.java
 * @Description : ItemHistory VO class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
@Data
@NoArgsConstructor
public class ItemHistoryVO extends ItemHistoryDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** ITM_HIS_NUM */
    private java.lang.String itmHisNum;
    
    /** ORD_NUM */
    private java.lang.String ordNum;
    
    /** ITM_DIV */
    private java.lang.String itmDiv;
    
    /** ITM_HIS_RDY */
    private java.lang.String itmHisRdy;
    
    /** ITM_NOTE */
    private java.lang.String itmNote;
    
    /** itm_history_d */
    
    /** ITM_HIS_D_NUM */
    private java.math.BigDecimal itmHisDNum;
    
    /** ITM_CODE */
    private java.lang.String itmCode;
    private java.lang.String itmName;
    
    /** ITM_VOL */
    private java.math.BigDecimal itmVol;
    
    /** LOT_NUM */
    private java.lang.String lotNum;
    
    /** ITM_PRICE */
    private java.math.BigDecimal itmPrice;
    
    /** ITM_NOTE */
    private java.lang.String itmNoteD;
    
    private java.lang.String aDate;
    private java.lang.String bDate;
    
    private java.lang.String operCode;
    private java.lang.String operName;
    
    private java.math.BigDecimal totalPrice;
    
	
    
   
    
}

