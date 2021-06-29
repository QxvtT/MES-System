package mes.sal.ord.service;

import java.sql.Date;

/**
 * @Class Name : OrderMVO.java
 * @Description : OrderM VO class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class OrderMVO extends OrderMDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** ORD_NUM */
    private java.lang.String ordNum;
    
    /** ORD_REQUEST_DATE */
    private java.lang.String ordRequestDate;
    
    /** ORD_DELIVERY_DATE */
    private java.lang.String ordDeliveryDate;
    
    /** OPER_CODE */
    private java.lang.String operCode;
    
    /** OPER_NAME */
    private java.lang.String operName;
    
    /** ITM_CODE */
    private java.lang.String itmCode;
    
    /** ORD_STATUS */
    private java.lang.String ordStatus;
    
    /** ORD_VOL */
    private java.math.BigDecimal ordVol;
    
    /** ORD_IND_VOL */
    private java.math.BigDecimal ordIndVol;
    
    /** ORD_OUT_VOL */
    private java.math.BigDecimal ordOutVol;
    
    /** ITM_STOCK */
    private java.math.BigDecimal itmStock;
    
    /** ORD_NOTE */
    private java.lang.String ordNote;
    
    /** PRD_CHK */
    private java.lang.String prdChk;
    
    private Date a_date;
    private Date b_date;
    
    
    
    public Date getA_date() {
		return a_date;
	}

	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public java.lang.String getOrdNum() {
        return this.ordNum;
    }
    
    public void setOrdNum(java.lang.String ordNum) {
        this.ordNum = ordNum;
    }
    

    
    public java.lang.String getOrdRequestDate() {
		return ordRequestDate;
	}

	public void setOrdRequestDate(java.lang.String ordRequestDate) {
		this.ordRequestDate = ordRequestDate;
	}

	public java.lang.String getOrdDeliveryDate() {
		return ordDeliveryDate;
	}

	public void setOrdDeliveryDate(java.lang.String ordDeliveryDate) {
		this.ordDeliveryDate = ordDeliveryDate;
	}

	public java.lang.String getOperCode() {
        return this.operCode;
    }
    
    public void setOperCode(java.lang.String operCode) {
        this.operCode = operCode;
    }
    
    public java.lang.String getOperName() {
        return this.operName;
    }
    
    public void setOperName(java.lang.String operName) {
        this.operName = operName;
    }
    public java.lang.String getItmCode() {
        return this.itmCode;
    }
    
    public void setItmCode(java.lang.String itmCode) {
        this.itmCode = itmCode;
    }
    
    public java.lang.String getOrdStatus() {
        return this.ordStatus;
    }
    
    public void setOrdStatus(java.lang.String ordStatus) {
        this.ordStatus = ordStatus;
    }
    
    public java.math.BigDecimal getOrdVol() {
        return this.ordVol;
    }
    
    public void setOrdVol(java.math.BigDecimal ordVol) {
        this.ordVol = ordVol;
    }
    
    public java.math.BigDecimal getOrdIndVol() {
        return this.ordIndVol;
    }
    
    public void setOrdIndVol(java.math.BigDecimal ordIndVol) {
        this.ordIndVol = ordIndVol;
    }
    
    public java.math.BigDecimal getOrdOutVol() {
        return this.ordOutVol;
    }
    
    public void setOrdOutVol(java.math.BigDecimal ordOutVol) {
        this.ordOutVol = ordOutVol;
    }
    
    public java.math.BigDecimal getItmStock() {
        return this.itmStock;
    }
    
    public void setItmStock(java.math.BigDecimal itmStock) {
        this.itmStock = itmStock;
    }
    
    public java.lang.String getOrdNote() {
        return this.ordNote;
    }
    
    public void setOrdNote(java.lang.String ordNote) {
        this.ordNote = ordNote;
    }
    
    public java.lang.String getPrdChk() {
        return this.prdChk;
    }
    
    public void setPrdChk(java.lang.String prdChk) {
        this.prdChk = prdChk;
    }
    
}
