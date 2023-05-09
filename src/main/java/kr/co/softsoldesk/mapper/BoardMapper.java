package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.beans.BoardBean;

public interface BoardMapper {
	
	@SelectKey(statement = "select content_seq.nextval from dual", keyProperty = "board_idx", before = true, resultType = int.class)
	@Insert("insert into board(board_idx, title, w_ID, w_name, text, boarddate, content_file) "
			+ "values (#{board_idx}, #{title}, #{w_ID}, #{w_name}, #{text}, sysdate, #{content_file, jdbcType = VARCHAR})")
	void addContentInfo(BoardBean writeBoardBean);
	
	@Select("select board_idx, title, w_name, boarddate "
			+ "from board, member "
			+ "where w_ID = ID "
			+ "order by board_idx desc")
	List<BoardBean> getContentList(RowBounds rowBounds);
	
	@Select("select w_name, "
			+ "boarddate, "
			+ "title, text, content_file, w_ID "
			+ "from board, member "
			+ "where w_ID = ID "
			+ "and board_idx = #{board_idx}")
	BoardBean getContentInfo(int board_idx);
	
	@Update("update board set title = #{title}, text =#{text}, content_file = #{content_file, jdbcType = VARCHAR} "
			+ "where board_idx = #{board_idx}")
	void modifyContentInfo(BoardBean modifyBoardBean);
	
	@Delete("delete from board where board_idx =#{board_idx}")
	void deleteContentInfo(int board_idx);
	
	//게시물 갯수 확인
	@Select("select count(*) from board")
	int getContentCnt();
}
