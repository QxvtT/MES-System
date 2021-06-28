package mes.mat.stc.service;

/**
 * @Class Name : MaterialHistoryVO.java
 * @Description : MaterialHistory VO class
 * @Modification Information
 *
 * @author materialHistory
 * @since 2021-06-28
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class MaterialHistoryVO extends MaterialHistoryDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** MAT_HIS_NUM */
    private java.math.BigDecimal matHisNum;
    
    /** MAT_HIS_DIV */
    private java.lang.String matHisDiv;
    
    /** MAT_HIS_DATE */
    private java.sql.Date matHisDate;
    
    /** MAT_OUT */
    private java.lang.String matOut;
    
    /** MAT_HIS_VOL */
    private java.math.BigDecimal matHisVol;
    
    public java.math.BigDecimal getMatHisNum() {
        return this.matHisNum;
    }
    
    public void setMatHisNum(java.math.BigDecimal matHisNum) {
        this.matHisNum = matHisNum;
    }
    
    public java.lang.String getMatHisDiv() {
        return this.matHisDiv;
    }
    
    public void setMatHisDiv(java.lang.String matHisDiv) {
        this.matHisDiv = matHisDiv;
    }
    
    public java.sql.Date getMatHisDate() {
        return this.matHisDate;
    }
    
    public void setMatHisDate(java.sql.Date matHisDate) {
        this.matHisDate = matHisDate;
    }
    
    public java.lang.String getMatOut() {
        return this.matOut;
    }
    
    public void setMatOut(java.lang.String matOut) {
        this.matOut = matOut;
    }
    
    public java.math.BigDecimal getMatHisVol() {
        return this.matHisVol;
    }
    
    public void setMatHisVol(java.math.BigDecimal matHisVol) {
        this.matHisVol = matHisVol;
    }
    
}
