package mes.board.service;

import java.util.List;
import mes.board.service.BoardDefaultVO;
import mes.board.service.BoardVO;

/**
 * @Class Name : BoardService.java
 * @Description : Board Business class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210621
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface BoardService {
	
	/**
	 * BOARD을 등록한다.
	 * @param vo - 등록할 정보가 담긴 BoardVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertBoard(BoardVO vo) throws Exception;
    
    /**
	 * BOARD을 수정한다.
	 * @param vo - 수정할 정보가 담긴 BoardVO
	 * @return void형
	 * @exception Exception
	 */
    void updateBoard(BoardVO vo) throws Exception;
    
    /**
	 * BOARD을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 BoardVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteBoard(BoardVO vo) throws Exception;
    
    /**
	 * BOARD을 조회한다.
	 * @param vo - 조회할 정보가 담긴 BoardVO
	 * @return 조회한 BOARD
	 * @exception Exception
	 */
    BoardVO selectBoard(BoardVO vo) throws Exception;
    
    /**
	 * BOARD 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return BOARD 목록
	 * @exception Exception
	 */
    List selectBoardList(BoardDefaultVO searchVO) throws Exception;
    
    /**
	 * BOARD 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return BOARD 총 갯수
	 * @exception
	 */
    int selectBoardListTotCnt(BoardDefaultVO searchVO);
    
}
