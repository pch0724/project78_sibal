package kr.co.softsoldesk.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.BoardBean;
import kr.co.softsoldesk.dao.BoardDao;

@Service
public class MainService {

	@Autowired
	public BoardDao boardDao;
	
	public List<BoardBean> getMainList() {
		RowBounds rowBounds = new RowBounds(0, 5);
		
		return boardDao.getContentList(rowBounds);
	}
}
