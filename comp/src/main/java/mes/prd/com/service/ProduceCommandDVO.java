package mes.prd.com.service;

import lombok.Data;

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
@Data
public class ProduceCommandDVO extends ProduceCommandDDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** 작업지시 관리에서 grid1 조회용 */
    
    /** 스크롤용 지시번호 */
    private java.lang.String prdComNum1;
    
    /** 스크롤용 일련번호 */
    private java.lang.String prdComDNum1;
    
    /** matLot모달 스크롤용 로트번호 */
    private java.lang.String lotNum1;
    
    /** 지시번호 */
    private java.lang.String prdComNum;
    /** 지시일자 */
    private java.lang.String prdComDate;
    /** 작업지시명 */
    private java.lang.String prdComName;
    /** 특기사항(=비고) */
    private java.lang.String prdComNote;
    
    
    /** 일련번호 */
    private java.math.BigDecimal prdComDNum;
    
    /** 계획일련번호 */
    private java.math.BigDecimal prdPlanDNum;
    
    /** 제품코드 */
    private java.lang.String itmCode;
    
    /** 제품명*/
    private java.lang.String itmName;
    
    /** 작업구분(정상,재작업) */
    private java.lang.String prcComDiv;
    
    /** 주문일련번호  --주문번호,납기일자, 주문량 */
    private java.math.BigDecimal ordDNum;
    
    /** 주문번호 */
    private java.lang.String ordNum;
    
    /** 업체명 */
    private java.lang.String operName;
    
    /** 납기일자 */
    private java.lang.String ordDeliveryDate;
    
    /** 주문량 */
    private java.math.BigDecimal ordVol;
    
    /** 기지시량 */
    private java.math.BigDecimal yesComVol;
    
    /** 미지시량 */
    private java.math.BigDecimal noComVol;
    
    /** 지시량 */
    private java.math.BigDecimal prdComVol;
    
    /** UPH */
    private java.math.BigDecimal uph;
    
    /** 일생산량(제품테이블) */
    private java.math.BigDecimal itmDayOutput;
    
    /** 일수 */
    private java.math.BigDecimal dayNum;
    
    /** 작업일자 */
    private java.lang.String prdComDDate;
    
    /** 작업일자 (yyyy-MM-dd)*/
    private java.lang.String prdComDDate1;
    
    /** 작업순서 */
    private java.math.BigDecimal prcComNo;
    
    /** 비고 */
    private java.lang.String prdComDNote;
    
    /** 자재코드 */
    private java.lang.String matCode;
    
    /** 자재명 */
    private java.lang.String matName;
    
    
    /** 제품 한줄별로 자재코드에 맞는 자재로트번호 및 사용 수량 */
    
    /** 지시자재일련번호 스크롤용 */
    private java.math.BigDecimal prdComMatNum;
    
    /** 순번 */
    private java.math.BigDecimal prdComMatO;
    
    /** LOT_NUM */
    private java.math.BigDecimal lotNum;
    
    /** 자재수량 */
    private java.math.BigDecimal matVol;
    
    /** 자재비고 */
    private java.lang.String prdComMatNote;
    
    
//자재출고관련
    /** 자재입출반관리 번호 */
    private java.lang.String matHisNum;
    
    /** 자재입출반관리 일자 */
    private java.lang.String matHisDate;
    
    /** 자재입출고관리용 건수 */
    private java.math.BigDecimal matHisVol;
    
    
    /** 공정흐름 이동번호 */
    private java.lang.String movNum;
    
    /** 공정흐름 입고량 */
    private java.math.BigDecimal prc_com_vol;
    
    
    /** 공정흐름D 일련번호 */
    private java.math.BigDecimal prc_res_d_num;
    

    
    
    
    
    
    /** 제품 한줄별로 공정흐름  */
    
    /** 순서 */
    private java.math.BigDecimal prcFNo;
    
    /** 공정코드 */
    private java.lang.String prcCode;
    
    /** 공정명 */
    private java.lang.String prcName;
    
    /** 공정비고 */
    private java.lang.String prcFExplain;
    
    /** 검색 시작 날짜 */
    private java.lang.String startDate;
    
    /** 검색 마지막 날짜 */
    private java.lang.String endDate;

	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
  
}
