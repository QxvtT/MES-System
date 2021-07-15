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
	
	ProduceCommandDVO grid1Data;
	ProduceCommandDVO grid2Data;
	List<ProduceCommandDVO> grid3Data;
}
 