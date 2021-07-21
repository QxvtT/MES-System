package mes.prd.pln.service;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Class Name : ProducePlanDVO.java
 * @Description : ProducePlanD VO class
 * @Modification Information
 *
 * @author Jeoung
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
@Data
@NoArgsConstructor
public class ProducePlanDVO {
    private static final long serialVersionUID = 1L;
    
    /** PRD_PLAN_D_NUM */
    private java.math.BigDecimal prdPlanDNum;
    
    /** PRD_NUM */
    private java.lang.String prdNum;
    
    /** ITM_CODE */
    private java.lang.String itmCode;
    
    /** PRD_WORK_VOL */
    private java.math.BigDecimal prdWorkVol;
    
    /** PRD_PLAN_DATE */
    private java.lang.String prdPlanDate;
    
    /** PRD_NO */
    private java.math.BigDecimal prdNo;
    
    /** PRD_NOTE */
    private java.lang.String prdDNote;
    
    /** COM_CHK */
    private java.lang.String comChk;
    
    /** ORD_NUM */
    private java.lang.String ordNum;
    
    /** 업체코드 검색 **/
    private java.lang.String operCodes;
    private List<String> operCodeList;
    
    /** 제품코드 검색 **/
    private java.lang.String itemCodes;
    private List<String> itemCodeList;
    
    // 생산계획 detail 테이블
    private java.lang.String itmName;
    private java.lang.String itmSize;
    private java.lang.String ordDeliveryDate;
    private java.lang.String ordRequestDate;
    private java.math.BigDecimal ordVol;
    private java.math.BigDecimal itmDayOutput;

    // 생산계획 master 테이블
    private java.lang.String prdDate;
    private java.lang.String prdName;
    private java.lang.String prdNote;
    
    private java.lang.String startDate;
    private java.lang.String endDate;

    private java.lang.String unpStartDate;
    private java.lang.String unpEndDate;
    
    private java.lang.String operName;
    
    private java.math.BigDecimal ordDNum;
    
    private java.math.BigDecimal prdPerDay;
    
    
}
