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
    private java.math.BigDecimal prdDate;
    
    /** PRD_COM_NUM */
    private java.lang.String operName;
    
    /** MAT_CODE */
    private java.lang.String itmCode;
    
    /** LOT_NUM */
    private java.math.BigDecimal itmName;
    
    /** ITM_CODE */
    private java.lang.String ordNum;
    
    /** PRC_F_NO */
    private java.math.BigDecimal ordDeliveryDate;
    
    /** PRD_COM_VOL */
    private java.math.BigDecimal ordVol;
    
    /** PRD_COM_D_DATE */
    private java.sql.Date prdWorkVol;
    
    /** PRC_COM_NO */
    private java.math.BigDecimal prdPlanDate;
    
    /** PRC_COM_DIV */
    private java.lang.String prdNo;
    
    /** MAT_VOL */
    private java.math.BigDecimal matVol;
    
    /** PRD_COM_NOTE */
    private java.lang.String prdDNote;

	public java.math.BigDecimal getPrdDate() {
		return prdDate;
	}

	public void setPrdDate(java.math.BigDecimal prdDate) {
		this.prdDate = prdDate;
	}

	public java.lang.String getOperName() {
		return operName;
	}

	public void setOperName(java.lang.String operName) {
		this.operName = operName;
	}

	public java.lang.String getItmCode() {
		return itmCode;
	}

	public void setItmCode(java.lang.String itmCode) {
		this.itmCode = itmCode;
	}

	public java.math.BigDecimal getItmName() {
		return itmName;
	}

	public void setItmName(java.math.BigDecimal itmName) {
		this.itmName = itmName;
	}

	public java.lang.String getOrdNum() {
		return ordNum;
	}

	public void setOrdNum(java.lang.String ordNum) {
		this.ordNum = ordNum;
	}

	public java.math.BigDecimal getOrdDeliveryDate() {
		return ordDeliveryDate;
	}

	public void setOrdDeliveryDate(java.math.BigDecimal ordDeliveryDate) {
		this.ordDeliveryDate = ordDeliveryDate;
	}

	public java.math.BigDecimal getOrdVol() {
		return ordVol;
	}

	public void setOrdVol(java.math.BigDecimal ordVol) {
		this.ordVol = ordVol;
	}

	public java.sql.Date getPrdWorkVol() {
		return prdWorkVol;
	}

	public void setPrdWorkVol(java.sql.Date prdWorkVol) {
		this.prdWorkVol = prdWorkVol;
	}

	public java.math.BigDecimal getPrdPlanDate() {
		return prdPlanDate;
	}

	public void setPrdPlanDate(java.math.BigDecimal prdPlanDate) {
		this.prdPlanDate = prdPlanDate;
	}

	public java.lang.String getPrdNo() {
		return prdNo;
	}

	public void setPrdNo(java.lang.String prdNo) {
		this.prdNo = prdNo;
	}

	public java.math.BigDecimal getMatVol() {
		return matVol;
	}

	public void setMatVol(java.math.BigDecimal matVol) {
		this.matVol = matVol;
	}

	public java.lang.String getPrdDNote() {
		return prdDNote;
	}

	public void setPrdDNote(java.lang.String prdDNote) {
		this.prdDNote = prdDNote;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
  
}
