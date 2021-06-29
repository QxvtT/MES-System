package mes.mat.stc.service;

/**
 * @Class Name : MaterialOrderVO.java
 * @Description : MaterialOrder VO class
 * @Modification Information
 *
 * @author materialOrder
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class MaterialOrderVO extends MaterialOrderDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** MAT_ORD_NUM */
    private java.math.BigDecimal matOrdNum;
    
    /** MAT_COM_NUM */
    private java.lang.String matComNum;
    
    /** MAT_ORD_DATE */
    private java.sql.Date matOrdDate;
    
    /** MAT_ORD_OPER */
    private java.lang.String matOrdOper;
    
    /** MAT_CODE */
    private java.lang.String matCode;
    
    /** MAT_COM_DATE */
    private java.sql.Date matComDate;
    
    /** OPER_CODE */
    private java.lang.String operCode;
    
    /** MAT_VOL */
    private java.math.BigDecimal matVol;
    
    /** MAT_ORD_VOL */
    private java.math.BigDecimal matOrdVol;
    
    /** MAT_NORD_VOL */
    private java.math.BigDecimal matNordVol;
    
    /** MAT_ORD_NOTE */
    private java.lang.String matOrdNote;
    
    public java.math.BigDecimal getMatOrdNum() {
        return this.matOrdNum;
    }
    
    public void setMatOrdNum(java.math.BigDecimal matOrdNum) {
        this.matOrdNum = matOrdNum;
    }
    
    public java.lang.String getMatComNum() {
        return this.matComNum;
    }
    
    public void setMatComNum(java.lang.String matComNum) {
        this.matComNum = matComNum;
    }
    
    public java.sql.Date getMatOrdDate() {
        return this.matOrdDate;
    }
    
    public void setMatOrdDate(java.sql.Date matOrdDate) {
        this.matOrdDate = matOrdDate;
    }
    
    public java.lang.String getMatOrdOper() {
        return this.matOrdOper;
    }
    
    public void setMatOrdOper(java.lang.String matOrdOper) {
        this.matOrdOper = matOrdOper;
    }
    
    public java.lang.String getMatCode() {
        return this.matCode;
    }
    
    public void setMatCode(java.lang.String matCode) {
        this.matCode = matCode;
    }
    
    public java.sql.Date getMatComDate() {
        return this.matComDate;
    }
    
    public void setMatComDate(java.sql.Date matComDate) {
        this.matComDate = matComDate;
    }
    
    public java.lang.String getOperCode() {
        return this.operCode;
    }
    
    public void setOperCode(java.lang.String operCode) {
        this.operCode = operCode;
    }
    
    public java.math.BigDecimal getMatVol() {
        return this.matVol;
    }
    
    public void setMatVol(java.math.BigDecimal matVol) {
        this.matVol = matVol;
    }
    
    public java.math.BigDecimal getMatOrdVol() {
        return this.matOrdVol;
    }
    
    public void setMatOrdVol(java.math.BigDecimal matOrdVol) {
        this.matOrdVol = matOrdVol;
    }
    
    public java.math.BigDecimal getMatNordVol() {
        return this.matNordVol;
    }
    
    public void setMatNordVol(java.math.BigDecimal matNordVol) {
        this.matNordVol = matNordVol;
    }
    
    public java.lang.String getMatOrdNote() {
        return this.matOrdNote;
    }
    
    public void setMatOrdNote(java.lang.String matOrdNote) {
        this.matOrdNote = matOrdNote;
    }
    
}
