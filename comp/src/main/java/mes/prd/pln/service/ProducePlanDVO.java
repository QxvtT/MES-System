package mes.prd.pln.service;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.EqualsAndHashCode;
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
@EqualsAndHashCode(callSuper=false)
public class ProducePlanDVO extends ProducePlanDDefaultVO{
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
    @JsonFormat(pattern = "yyyy-MM-dd")
    private java.sql.Date prdPlanDate;
    
    /** PRD_NO */
    private java.math.BigDecimal prdNo;
    
    /** PRD_NOTE */
    private java.lang.String prdDNote;
    
    /** COM_CHK */
    private java.lang.String comChk;
    
    /** ORD_NUM */
    private java.lang.String ordNum;
    
    // 생산계획 detail 테이블
    private java.lang.String itmName;
    private java.lang.String matCode;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private java.sql.Date ordDeliveryDate;
    private java.math.BigDecimal ordVol;
    private java.math.BigDecimal itmDayOutput;

    // 생산계획 master 테이블
    @JsonFormat(pattern = "yyyy-MM-dd")
    private java.sql.Date prdDate;
    private java.lang.String prdName;
    private java.lang.String prdNote;
    
    private java.lang.String startDate;
    private java.lang.String endDate;
    
    
}
