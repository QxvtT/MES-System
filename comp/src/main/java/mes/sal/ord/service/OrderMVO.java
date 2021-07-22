package mes.sal.ord.service;

import java.sql.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Class Name : OrderMVO.java
 * @Description : OrderM VO class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Data
@NoArgsConstructor
public class OrderMVO extends OrderMDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** ORD_NUM */
    private java.lang.String ordNum;
    private java.lang.String ordNum1;
    
    /** ORD_REQUEST_DATE */
    private java.lang.String ordRequestDate;
    
    /** ORD_DELIVERY_DATE */
    private java.lang.String ordDeliveryDate;
    
    /** OPER_CODE */
    private java.lang.String operCode;
    
    private List operCodes;
    
    /** OPER_NAME */
    private java.lang.String operName;
    
    /** ITM_CODE */
    private java.lang.String itmCode;
    /** ITM_NAME */
    private java.lang.String itmName;
    
    /** ORD_STATUS */
    private java.lang.String ordStatus;
    
    /** ORD_VOL */
    private java.math.BigDecimal ordVol;
    
    /** ORD_IND_VOL */
    private java.math.BigDecimal ordIndVol;
    
    /** ORD_OUT_VOL */
    private java.math.BigDecimal ordOutVol;
    
    /** ITM_STOCK */
    private java.math.BigDecimal itmStock;
    private java.math.BigDecimal ordDNum;
    
    /** ORD_NOTE */
    private java.lang.String ordNote;
    
    /** PRD_CHK */
    private java.lang.String prdChk;
    
    private java.lang.String aDate;
    private java.lang.String bDate;
    private java.lang.String date;
    
    
    
    
    
   }

