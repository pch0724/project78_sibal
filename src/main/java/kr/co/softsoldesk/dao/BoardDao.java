package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.BoardBean;
import kr.co.softsoldesk.mapper.BoardMapper;

@Repository
public class BoardDao {

	@Autowired
	private BoardMapper boardMapper;
	
	public void addContentInfo(BoardBean writeBoardBean) {
		boardMapper.addContentInfo(writeBoardBean);
	}
	
	public List<BoardBean> getContentList(RowBounds rowBounds){
		return boardMapper.getContentList(rowBounds);
	}
	
	public BoardBean getContentInfo(int board_idx) {
		return boardMapper.getContentInfo(board_idx);
	}
	
	public void modifyContentInfo(BoardBean modifyBoardBean) {
		boardMapper.modifyContentInfo(modifyBoardBean);
	}
	public void deleteContentInfo(int board_idx) {
		boardMapper.deleteContentInfo(board_idx);
	}
	
	public int getContentCnt() {
		return boardMapper.getContentCnt();
	}
}
