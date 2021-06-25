package mes.prd.com.service;

/**
 * @Class Name : ProduceCommandDVO.java
 * @Description : ProduceCommandD VO class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210625
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class ProduceCommandDVO extends ProduceCommandDDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** PRD_COM_D_NUM */
    private java.math.BigDecimal prdComDNum;
    
    /** PRD_COM_NUM */
    private java.lang.String prdComNum;
    
    /** MAT_CODE */
    private java.lang.String matCode;
    
    /** LOT_NUM */
    private java.math.BigDecimal lotNum;
    
    /** ITM_CODE */
    private java.lang.String itmCode;
    
    /** PRC_F_NO */
    private java.math.BigDecimal prcFNo;
    
    /** PRD_COM_VOL */
    private java.math.BigDecimal prdComVol;
    
    /** PRD_COM_D_DATE */
    private java.sql.Date prdComDDate;
    
    /** PRC_COM_NO */
    private java.math.BigDecimal prcComNo;
    
    /** PRC_COM_DIV */
    private java.lang.String prcComDiv;
    
    /** MAT_VOL */
    private java.math.BigDecimal matVol;
    
    /** PRD_COM_NOTE */
    private java.lang.String prdComNote;
    
    /** DIV_MAT_CODE */
    private java.lang.String divMatCode;
    
    /** DIV_LOT_NUM */
    private java.lang.String divLotNum;
    
    /** PRD_PLAN_NUM */
    private java.lang.String prdPlanNum;
    
    public java.math.BigDecimal getPrdComDNum() {
        return this.prdComDNum;
    }
    
    public void setPrdComDNum(java.math.BigDecimal prdComDNum) {
        this.prdComDNum = prdComDNum;
    }
    
    public java.lang.String getPrdComNum() {
        return this.prdComNum;
    }
    
    public void setPrdComNum(java.lang.String prdComNum) {
        this.prdComNum = prdComNum;
    }
    
    public java.lang.String getMatCode() {
        return this.matCode;
    }
    
    public void setMatCode(java.lang.String matCode) {
        this.matCode = matCode;
    }
    
    public java.math.BigDecimal getLotNum() {
        return this.lotNum;
    }
    
    public void setLotNum(java.math.BigDecimal lotNum) {
        this.lotNum = lotNum;
    }
    
    public java.lang.String getItmCode() {
        return this.itmCode;
    }
    
    public void setItmCode(java.lang.String itmCode) {
        this.itmCode = itmCode;
    }
    
    public java.math.BigDecimal getPrcFNo() {
        return this.prcFNo;
    }
    
    public void setPrcFNo(java.math.BigDecimal prcFNo) {
        this.prcFNo = prcFNo;
    }
    
    public java.math.BigDecimal getPrdComVol() {
        return this.prdComVol;
    }
    
    public void setPrdComVol(java.math.BigDecimal prdComVol) {
        this.prdComVol = prdComVol;
    }
    
    public java.sql.Date getPrdComDDate() {
        return this.prdComDDate;
    }
    
    public void setPrdComDDate(java.sql.Date prdComDDate) {
        this.prdComDDate = prdComDDate;
    }
    
    public java.math.BigDecimal getPrcComNo() {
        return this.prcComNo;
    }
    
    public void setPrcComNo(java.math.BigDecimal prcComNo) {
        this.prcComNo = prcComNo;
    }
    
    public java.lang.String getPrcComDiv() {
        return this.prcComDiv;
    }
    
    public void setPrcComDiv(java.lang.String prcComDiv) {
        this.prcComDiv = prcComDiv;
    }
    
    public java.math.BigDecimal getMatVol() {
        return this.matVol;
    }
    
    public void setMatVol(java.math.BigDecimal matVol) {
        this.matVol = matVol;
    }
    
    public java.lang.String getPrdComNote() {
        return this.prdComNote;
    }
    
    public void setPrdComNote(java.lang.String prdComNote) {
        this.prdComNote = prdComNote;
    }
    
    public java.lang.String getDivMatCode() {
        return this.divMatCode;
    }
    
    public void setDivMatCode(java.lang.String divMatCode) {
        this.divMatCode = divMatCode;
    }
    
    public java.lang.String getDivLotNum() {
        return this.divLotNum;
    }
    
    public void setDivLotNum(java.lang.String divLotNum) {
        this.divLotNum = divLotNum;
    }
    
    public java.lang.String getPrdPlanNum() {
        return this.prdPlanNum;
    }
    
    public void setPrdPlanNum(java.lang.String prdPlanNum) {
        this.prdPlanNum = prdPlanNum;
    }
    
}
