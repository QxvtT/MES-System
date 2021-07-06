package mes.sal.out.service;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Class Name : ItemHistoryVO.java
 * @Description : ItemHistory VO class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
@Data
@NoArgsConstructor
public class ItemHistoryVO extends ItemHistoryDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** itm_history_M */
    
    /** 전표번호*/
    private java.lang.String itmHisNum;
    /** 주문번호 */
    private java.lang.String ordNum;
    
    /** 구분(출고,반품) */
    private java.lang.String itmDiv;
    
    /** 준비일자 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private java.sql.Date itmHisRdy;
    
    /** 마스터-특이사항 */
    private java.lang.String itmNote;
    
    /** itm_history_d */
    
    /** 디테일일련번호 */
    private java.math.BigDecimal itmHisDNum;
    private java.math.BigDecimal count;
    
    /** 제품코드-제품명 */
    private java.lang.String itmCode;
    private java.lang.String itmName;
    
    /** 수량 */
    private java.math.BigDecimal itmVol;
    
    /** LOT_NUM */
    private java.lang.String lotNum;
    
    /** 단가 */
    private java.math.BigDecimal itmPrice;
    
    /** 재품재고 */
    private java.math.BigDecimal itmStock;
    /** 규격 */
    private java.lang.String itmSize;
    /** 단위 */
    private java.lang.String itmUnit;
    
    
    
    /** 디테일-비고 */
    private java.lang.String itmNoteD;
    /** 기간검색 bDate ~ aDate */
    private java.lang.String aDate;
    private java.lang.String bDate;
    /** 업체코드-업체명 */
    private java.lang.String operCode;
    private java.lang.String operName;
    /** 제품금액 수량*단가*/
    private java.math.BigDecimal totalPrice;
    /** 중복검색 sql  */
    private java.lang.String str;
    
    /** 기출고량  */
    private java.math.BigDecimal ordOutVol;
    /** 미출고량  */
    private java.math.BigDecimal itmNoutVol;
    /** 주문량  */
    private java.math.BigDecimal ordVol;
   
    
    
    
	
    
   
    
}

