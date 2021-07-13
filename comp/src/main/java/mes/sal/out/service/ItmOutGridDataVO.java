package mes.sal.out.service;

import java.util.List;

import lombok.Data;
@Data
public class ItmOutGridDataVO {
	List<ItemHistoryVO> createdRows;
	List<ItemHistoryVO> deletedRows;
	List<ItemHistoryVO> updatedRows;
	
	ItemHistoryVO itemHistoryVO; 
}
 