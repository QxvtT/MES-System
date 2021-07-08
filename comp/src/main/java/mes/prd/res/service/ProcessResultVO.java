package mes.prd.res.service;

import lombok.Data;

/**
 * @Class Name : ProcessResultVO.java
 * @Description : ProcessResult VO class
 * @Modification Information
 *
 * @author seongwon
 * @since 20210706
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Data
public class ProcessResultVO extends ProcessResultDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** 이동번호 */
    private java.lang.String movNum;
    
    /** 지시번호 */
    private java.lang.String prdComNum;
    
    /** 제품코드 */
    private java.lang.String itmCode;
    
    /** 제품명 item */
    private java.lang.String itmName;
    
    
    /** 기업명 item */
    private java.lang.String operName;
    
    /** 자재 LOT_NO*/
    private java.lang.String lotNum;
    
    /** 입고량 */
    private java.math.BigDecimal prcComVol;
    
    /** 포장량*/
    private java.math.BigDecimal prcPackVol;
    
    /** 미포장량 */
    private java.math.BigDecimal prcNVol;
    
    
    /** 실적량*/
    private java.math.BigDecimal prcBckVol;
    
    
    /** 작업시작날짜 produce_command*/
    private java.lang.String prdComDDate;
    
    
    
    /** 일련번호*/
    private java.math.BigDecimal rowNum;

    
    /** 디테일 */
    
    /** 일련번호*/
    private java.math.BigDecimal prcResDNum;
    
   
    /** 순서*/
    private java.math.BigDecimal prcResNo;
    
    /** 공정코드*/
    private java.lang.String prcCode;
    
    /** 공정상태*/
    private java.lang.String prcState;
    
    /** 설비코드*/
    private java.lang.String macCode;
    
    /** 작업번호*/
    private java.lang.String prcWorkNum;
    
    /** 작업자 */
    private java.lang.String empId;
    
    /** 작업량*/
    private java.math.BigDecimal prcResVol;
    
    /** 불량량*/
    private java.math.BigDecimal prcErrVol;
    
    /** 비고*/
    private java.lang.String prcResultDNote;
    
    /** 작업시작시간*/
    private java.lang.String prcStrTime;
    
    /** 작업종료시간*/
    private java.lang.String prcEndTime;
    
    /** 디테일입고량 */
    private java.math.BigDecimal prcComDVol;
    
    /** 작업지시디테일 일련번호PK */
    private java.math.BigDecimal prdComDNum;
    
    /** 작업지시디테일 순서 */
    private java.math.BigDecimal prdComMatO;
    
    
}