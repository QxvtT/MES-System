package mes.prd.com.service;

import java.util.List;

import lombok.Data;
@Data
public class GridDataVO {
	List<ProduceCommandDVO> createdRows;
	List<ProduceCommandDVO> deletedRows;
	List<ProduceCommandDVO> updatedRows;
	
	
	List<ProduceCommandDVO> matRows;
	List<ProduceCommandDVO> flowRows;
	
	ProduceCommandDVO produceCommandDVO; 
}
 