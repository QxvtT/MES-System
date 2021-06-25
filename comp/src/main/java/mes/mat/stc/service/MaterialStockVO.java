package mes.mat.stc.service;

/**
 * @Class Name : MaterialStockVO.java
 * @Description : MaterialStock VO class
 * @Modification Information
 *
 * @author materialStock
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class MaterialStockVO extends MaterialStockDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** LOT_NUM */
    private java.math.BigDecimal lotNum;
    
    /** MAT_CODE */
    private java.lang.String matCode;
    
    /** MAT_VOL */
    private java.math.BigDecimal matVol;
    
    public java.math.BigDecimal getLotNum() {
        return this.lotNum;
    }
    
    public void setLotNum(java.math.BigDecimal lotNum) {
        this.lotNum = lotNum;
    }
    
    public java.lang.String getMatCode() {
        return this.matCode;
    }
    
    public void setMatCode(java.lang.String matCode) {
        this.matCode = matCode;
    }
    
    public java.math.BigDecimal getMatVol() {
        return this.matVol;
    }
    
    public void setMatVol(java.math.BigDecimal matVol) {
        this.matVol = matVol;
    }
    
}
