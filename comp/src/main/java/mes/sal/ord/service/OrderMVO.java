package mes.sal.ord.service;

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
    private java.sql.Date ordRequestDate;
    
    /** ORD_DELIVERY_DATE */
    private java.sql.Date ordDeliveryDate;
    
    /** OPER_CODE */
    private java.lang.String operCode;
    
    /** OPER_NAME */
    private java.lang.String operName;
    
    public java.lang.String getOrdNum() {
        return this.ordNum;
    }
    
    public void setOrdNum(java.lang.String ordNum) {
        this.ordNum = ordNum;
    }
    
    public java.sql.Date getOrdRequestDate() {
        return this.ordRequestDate;
    }
    
    public void setOrdRequestDate(java.sql.Date ordRequestDate) {
        this.ordRequestDate = ordRequestDate;
    }
    
    public java.sql.Date getOrdDeliveryDate() {
        return this.ordDeliveryDate;
    }
    
    public void setOrdDeliveryDate(java.sql.Date ordDeliveryDate) {
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
    
}
