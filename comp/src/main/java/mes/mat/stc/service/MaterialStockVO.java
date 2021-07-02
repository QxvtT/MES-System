package mes.mat.stc.service;

/**
 * @Class Name : MaterialVO.java
 * @Description : Material VO class
 * @Modification Information
 *
 * @author material
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class MaterialStockVO extends MaterialDefaultVO{
    private static final long serialVersionUID = 1L;
    
    private java.lang.String out;
    
    private java.lang.String mShort;
    
    public java.lang.String getOut() {
		return out;
	}

	public void setOut(java.lang.String out) {
		this.out = out;
	}

	public java.lang.String getmShort() {
		return mShort;
	}

	public void setmShort(java.lang.String mShort) {
		this.mShort = mShort;
	}

	public void setMatMaxStock(java.lang.String matMaxStock) {
		this.matMaxStock = matMaxStock;
	}

	private java.lang.String str;
    
    /** mat_code */
    private java.lang.String matCode;
    
    /** oper_code */
    private java.lang.String operCode;
    
    /** mat_name */
    private java.lang.String matName;
    
    /** mat_barcode */
    private java.lang.String matBarcode;
    
    /** mat_size */
    private java.lang.String matSize;
    
    /** mat_unit */
    private java.lang.String matUnit;
    
    /** emp_id */
    private java.lang.String empId;
    
    /** mat_grp */
    private java.lang.String matGrp;
    
    /** mat_div */
    private java.lang.String matDiv;
    
    /** mat_kind_div */
    private java.lang.String matKindDiv;
    
    /** mat_using */
    private java.lang.String matUsing;
    
    /** mat_testing */
    private java.lang.String matTesting;
    
    /** cylinder */
    private java.lang.String cylinder;
    
    /** mat_lot_div */
    private java.lang.String matLotDiv;
    
    /** mat_safe_stock_mag */
    private java.lang.String matSafeStockMag;
    
    /** mat_safe_stock */
    private java.lang.String matSafeStock;
    
    /** mat_safe_date */
    private java.lang.String matSafeDate;
    
    /** mat_prd_date */
    private java.lang.String matPrdDate;
    
    /** mat_1m_usage */
    private java.lang.String mat1mUsage;
    
    /** mat_6m_usage */
    private java.lang.String mat6mUsage;
    
    /** mat_min_stock */
    private java.lang.String matMinStock;
    
    /** mat_max_stock */
    private java.lang.String matMaxStock;
    
    public java.lang.String getOperCode() {
        return this.operCode;
    }
    
    public void setOperCode(java.lang.String operCode) {
        this.operCode = operCode;
    }
    
    public java.lang.String getMatName() {
        return this.matName;
    }
    
    public void setMatName(java.lang.String matName) {
        this.matName = matName;
    }
    
    public java.lang.String getMatBarcode() {
        return this.matBarcode;
    }
    
    public void setMatBarcode(java.lang.String matBarcode) {
        this.matBarcode = matBarcode;
    }
    
    public java.lang.String getMatSize() {
        return this.matSize;
    }
    
    public void setMatSize(java.lang.String matSize) {
        this.matSize = matSize;
    }
    
    public java.lang.String getMatUnit() {
        return this.matUnit;
    }
    
    public void setMatUnit(java.lang.String matUnit) {
        this.matUnit = matUnit;
    }
    
    public java.lang.String getEmpId() {
        return this.empId;
    }
    
    public void setEmpId(java.lang.String empId) {
        this.empId = empId;
    }
    
    public java.lang.String getMatGrp() {
        return this.matGrp;
    }
    
    public void setMatGrp(java.lang.String matGrp) {
        this.matGrp = matGrp;
    }
    
    public java.lang.String getMatDiv() {
        return this.matDiv;
    }
    
    public void setMatDiv(java.lang.String matDiv) {
        this.matDiv = matDiv;
    }
    
    public java.lang.String getMatKindDiv() {
        return this.matKindDiv;
    }
    
    public void setMatKindDiv(java.lang.String matKindDiv) {
        this.matKindDiv = matKindDiv;
    }
    
    public java.lang.String getMatUsing() {
        return this.matUsing;
    }
    
    public void setMatUsing(java.lang.String matUsing) {
        this.matUsing = matUsing;
    }
    
    public java.lang.String getMatTesting() {
        return this.matTesting;
    }
    
    public void setMatTesting(java.lang.String matTesting) {
        this.matTesting = matTesting;
    }
    
    public java.lang.String getCylinder() {
        return this.cylinder;
    }
    
    public void setCylinder(java.lang.String cylinder) {
        this.cylinder = cylinder;
    }
    
    public java.lang.String getMatLotDiv() {
        return this.matLotDiv;
    }
    
    public void setMatLotDiv(java.lang.String matLotDiv) {
        this.matLotDiv = matLotDiv;
    }
    
    public java.lang.String getMatSafeStockMag() {
        return this.matSafeStockMag;
    }
    
    public void setMatSafeStockMag(java.lang.String matSafeStockMag) {
        this.matSafeStockMag = matSafeStockMag;
    }
    
    public java.lang.String getMatSafeStock() {
        return this.matSafeStock;
    }
    
    public void setMatSafeStock(java.lang.String matSafeStock) {
        this.matSafeStock = matSafeStock;
    }
    
    public java.lang.String getMatSafeDate() {
        return this.matSafeDate;
    }
    
    public void setMatSafeDate(java.lang.String matSafeDate) {
        this.matSafeDate = matSafeDate;
    }
    
    public java.lang.String getMatPrdDate() {
        return this.matPrdDate;
    }
    
    public void setMatPrdDate(java.lang.String matPrdDate) {
        this.matPrdDate = matPrdDate;
    }
    
    public java.lang.String getMat1mUsage() {
        return this.mat1mUsage;
    }
    
    public void setMat1mUsage(java.lang.String mat1mUsage) {
        this.mat1mUsage = mat1mUsage;
    }
    
    public java.lang.String getMat6mUsage() {
        return this.mat6mUsage;
    }
    
    public void setMat6mUsage(java.lang.String mat6mUsage) {
        this.mat6mUsage = mat6mUsage;
    }
    
    public java.lang.String getMatMinStock() {
        return this.matMinStock;
    }
    
    public void setMatMinStock(java.lang.String matMinStock) {
        this.matMinStock = matMinStock;
    }
    
    public java.lang.String getMatMaxStock() {
        return this.matMaxStock;
    }
    
    public void setMatMaxstock(java.lang.String matMaxStock) {
        this.matMaxStock = matMaxStock;
    }
    
    /** MAT_HIS_D_NUM */
    private java.math.BigDecimal matHisDNum;
    
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
    
    /** LOT_NUM */
    private java.math.BigDecimal lotNum;
    
    /** MAT_VOL */
    private java.math.BigDecimal matVol;
    
    public java.math.BigDecimal getLotNum() {
        return this.lotNum;
    }
    
    public void setLotNum(java.math.BigDecimal lotNum) {
        this.lotNum = lotNum;
    }
    
    public java.math.BigDecimal getMatVol() {
        return this.matVol;
    }
    
    public void setMatVol(java.math.BigDecimal matVol) {
        this.matVol = matVol;
    }
    
    /** MAT_ORD_NUM */
    private java.math.BigDecimal matOrdNum;
    
    /** MAT_ORD_DATE */
    private java.sql.Date matOrdDate;
    
    /** MAT_ORD_OPER */
    private java.lang.String matOrdOper;
    
    /** MAT_COM_DATE */
    private java.sql.Date matComDate;
    
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

    public java.sql.Date getMatComDate() {
        return this.matComDate;
    }
    
    public void setMatComDate(java.sql.Date matComDate) {
        this.matComDate = matComDate;
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

	public java.lang.String getStr() {
		return str;
	}

	public void setStr(java.lang.String str) {
		this.str = str;
	}
    
}
