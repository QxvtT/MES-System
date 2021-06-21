package mes.board.service;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * @Class Name : BoardVO.java
 * @Description : Board VO class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210621
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class BoardVO extends BoardDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** NO */
    private java.math.BigDecimal no;
    
    /** TITLE */
    private java.lang.String title;
    
    /** CONTENT */
    private java.lang.String content;
    
    /** WDATE */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private java.util.Date wdate;
    
    public java.math.BigDecimal getNo() {
        return this.no;
    }
    
    public void setNo(java.math.BigDecimal no) {
        this.no = no;
    }
    
    public java.lang.String getTitle() {
        return this.title;
    }
    
    public void setTitle(java.lang.String title) {
        this.title = title;
    }
    
    public java.lang.String getContent() {
        return this.content;
    }
    
    public void setContent(java.lang.String content) {
        this.content = content;
    }
    
    public java.util.Date getWdate() {
        return this.wdate;
    }
    
    public void setWdate(java.util.Date wdate) {
        this.wdate = wdate;
    }
    
}
