package mes.common.modal.service;

import lombok.Data;

/**
 * @Class Name : OperationVO.java
 * @Description : Operation VO class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Data
public class MachineVO extends OperationDefaultVO{
    private static final long serialVersionUID = 1L;
    
 
    // 설비검색

    private java.lang.String macCode;
 
    private java.lang.String macName;
   
    private java.lang.String macDiv;
    
    private java.lang.String macSize;
    
  

 
}
