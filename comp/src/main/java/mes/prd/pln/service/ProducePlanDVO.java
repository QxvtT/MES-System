package mes.prd.pln.service;

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
    private java.sql.Date prdPlanDate;
    
    /** PRD_NO */
    private java.math.BigDecimal prdNo;
    
    /** PRD_NOTE */
    private java.lang.String prdNote;
    
    /** COM_CHK */
    private java.lang.String comChk;
    
    /** ORD_NUM */
    private java.lang.String ordNum;
    
    public java.math.BigDecimal getPrdPlanDNum() {
        return this.prdPlanDNum;
    }
    
    public void setPrdPlanDNum(java.math.BigDecimal prdPlanDNum) {
        this.prdPlanDNum = prdPlanDNum;
    }
    
    public java.lang.String getPrdNum() {
        return this.prdNum;
    }
    
    public void setPrdNum(java.lang.String prdNum) {
        this.prdNum = prdNum;
    }
    
    public java.lang.String getItmCode() {
        return this.itmCode;
    }
    
    public void setItmCode(java.lang.String itmCode) {
        this.itmCode = itmCode;
    }
    
    public java.math.BigDecimal getPrdWorkVol() {
        return this.prdWorkVol;
    }
    
    public void setPrdWorkVol(java.math.BigDecimal prdWorkVol) {
        this.prdWorkVol = prdWorkVol;
    }
    
    public java.sql.Date getPrdPlanDate() {
        return this.prdPlanDate;
    }
    
    public void setPrdPlanDate(java.sql.Date prdPlanDate) {
        this.prdPlanDate = prdPlanDate;
    }
    
    public java.math.BigDecimal getPrdNo() {
        return this.prdNo;
    }
    
    public void setPrdNo(java.math.BigDecimal prdNo) {
        this.prdNo = prdNo;
    }
    
    public java.lang.String getPrdNote() {
        return this.prdNote;
    }
    
    public void setPrdNote(java.lang.String prdNote) {
        this.prdNote = prdNote;
    }
    
    public java.lang.String getComChk() {
        return this.comChk;
    }
    
    public void setComChk(java.lang.String comChk) {
        this.comChk = comChk;
    }
    
    public java.lang.String getOrdNum() {
        return this.ordNum;
    }
    
    public void setOrdNum(java.lang.String ordNum) {
        this.ordNum = ordNum;
    }
    
}
