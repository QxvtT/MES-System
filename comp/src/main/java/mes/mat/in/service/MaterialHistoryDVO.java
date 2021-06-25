package mes.mat.in.service;

/**
 * @Class Name : MaterialHistoryDVO.java
 * @Description : MaterialHistoryD VO class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210625
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class MaterialHistoryDVO extends MaterialHistoryDDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** MAT_HIS_D_NUM */
    private java.math.BigDecimal matHisDNum;
    
    /** MAT_HIS_NUM */
    private java.math.BigDecimal matHisNum;
    
    /** MAT_CODE */
    private java.lang.String matCode;
    
    /** MAT_COM_NUM */
    private java.lang.String matComNum;
    
    /** LOT_NO */
    private java.math.BigDecimal lotNo;
    
    /** MAT_HIS_D_VOL */
    private java.math.BigDecimal matHisDVol;
    
    /** MAT_HIS_PRICE */
    private java.math.BigDecimal matHisPrice;
    
    /** MAT_OUT_OPER */
    private java.lang.String matOutOper;
    
    public java.math.BigDecimal getMatHisDNum() {
        return this.matHisDNum;
    }
    
    public void setMatHisDNum(java.math.BigDecimal matHisDNum) {
        this.matHisDNum = matHisDNum;
    }
    
    public java.math.BigDecimal getMatHisNum() {
        return this.matHisNum;
    }
    
    public void setMatHisNum(java.math.BigDecimal matHisNum) {
        this.matHisNum = matHisNum;
    }
    
    public java.lang.String getMatCode() {
        return this.matCode;
    }
    
    public void setMatCode(java.lang.String matCode) {
        this.matCode = matCode;
    }
    
    public java.lang.String getMatComNum() {
        return this.matComNum;
    }
    
    public void setMatComNum(java.lang.String matComNum) {
        this.matComNum = matComNum;
    }
    
    public java.math.BigDecimal getLotNo() {
        return this.lotNo;
    }
    
    public void setLotNo(java.math.BigDecimal lotNo) {
        this.lotNo = lotNo;
    }
    
    public java.math.BigDecimal getMatHisDVol() {
        return this.matHisDVol;
    }
    
    public void setMatHisDVol(java.math.BigDecimal matHisDVol) {
        this.matHisDVol = matHisDVol;
    }
    
    public java.math.BigDecimal getMatHisPrice() {
        return this.matHisPrice;
    }
    
    public void setMatHisPrice(java.math.BigDecimal matHisPrice) {
        this.matHisPrice = matHisPrice;
    }
    
    public java.lang.String getMatOutOper() {
        return this.matOutOper;
    }
    
    public void setMatOutOper(java.lang.String matOutOper) {
        this.matOutOper = matOutOper;
    }
    
}
