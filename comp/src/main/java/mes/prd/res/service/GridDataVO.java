package mes.prd.res.service;

import java.util.List;

import lombok.Data;
@Data
public class GridDataVO {
	List<ProcessResultVO> createdRows;
	List<ProcessResultVO> deletedRows;
	List<ProcessResultVO> updatedRows;
	
	ProcessResultVO processResultVO; 
}
 