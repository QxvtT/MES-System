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
    private java.lang.String prdDNote;
    
    /** COM_CHK */
    private java.lang.String comChk;
    
    /** ORD_NUM */
    private java.lang.String ordNum;
    
    // 생산계획 detail 테이블
    private java.lang.String itmName;
    private java.lang.String matCode;
    private java.sql.Date ordDeliveryDate;
    private java.math.BigDecimal ordVol;
    private java.math.BigDecimal itmDayOutput;

    // 생산계획 master 테이블
    private java.sql.Date prdDate;
    private java.lang.String prdName;
    private java.lang.String prdNote;
    
    private java.sql.Date startDate;
    private java.sql.Date endDate;
    
    public java.sql.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.sql.Date startDate) {
		this.startDate = startDate;
	}

	public java.sql.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.sql.Date endDate) {
		this.endDate = endDate;
	}

	public java.sql.Date getPrdDate() {
		return prdDate;
	}

	public void setPrdDate(java.sql.Date prdDate) {
		this.prdDate = prdDate;
	}

	public java.lang.String getPrdName() {
		return prdName;
	}

	public void setPrdName(java.lang.String prdName) {
		this.prdName = prdName;
	}

	public java.lang.String getPrdNote() {
		return prdNote;
	}

	public void setPrdNote(java.lang.String prdNote) {
		this.prdNote = prdNote;
	}

	public java.lang.String getItmName() {
		return itmName;
	}

	public void setItmName(java.lang.String itmName) {
		this.itmName = itmName;
	}

	public java.lang.String getMatCode() {
		return matCode;
	}

	public void setMatCode(java.lang.String matCode) {
		this.matCode = matCode;
	}

	public java.sql.Date getOrdDeliveryDate() {
		return ordDeliveryDate;
	}

	public void setOrdDeliveryDate(java.sql.Date ordDeliveryDate) {
		this.ordDeliveryDate = ordDeliveryDate;
	}

	public java.math.BigDecimal getOrdVol() {
		return ordVol;
	}

	public void setOrdVol(java.math.BigDecimal ordVol) {
		this.ordVol = ordVol;
	}

	public java.math.BigDecimal getItmDayOutput() {
		return itmDayOutput;
	}

	public void setItmDayOutput(java.math.BigDecimal itmDayOutput) {
		this.itmDayOutput = itmDayOutput;
	}

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
    
    public java.lang.String getPrdDNote() {
        return this.prdDNote;
    }
    
    public void setPrdDNote(java.lang.String prdDNote) {
        this.prdDNote = prdDNote;
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
