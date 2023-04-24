package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.MemberBean;

public interface MemberMapper {
	
	@Select("select Name from member where ID = #{ID}")
	String checkMemberIdExist(String ID);
	
	@Select("select ID, Name, Password, Birth_Date, Phone_num, Emergency_Contact, Address, Entrance_Date, Email, R_id from member where ID = #{ID} and Password = #{Password}")
	MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean);
	
	@Select("select ID, Name, Password, Birth_date, Phone_num, Emergency_Contact, Address, Entrance_Date, Email, R_id from member where ID = #{ID}")
	MemberBean getModifyMemberInfo(int ID);
	
	@Update("update member set Password = #{Password} where ID = #{ID}")
	void modifyMemberInfo(MemberBean modifyMemberBean);

}
