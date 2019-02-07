package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
	
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO board);
	
	public int gettotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("bno") int bno, @Param("amount") int amount);
}
