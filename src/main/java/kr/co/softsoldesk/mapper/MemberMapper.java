package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;

public interface MemberMapper {
	
	@Select("select Name from member where ID = #{ID}")
	String checkMemberIdExist(String ID);
	
	@Select("select ID, Name, Password, Birth_Date, Phone_num, Emergency_Contact, Address, Entrance_Date, Email, R_id, first_login from member where ID = #{ID} and Password = #{Password}")
	MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean);
	
	@Select("select first_login from member where ID = #{ID}")
	String checkFirstLoginMember(int ID);
	
	@Update("update member set Password = #{Password}, first_login = 'true' where ID = #{ID}")
	void modifyFirstLogin(MemberBean modifyFirstLogin);
	
	@Select("select ID, Name, Password, Birth_date, Phone_num, Emergency_Contact, Address, Entrance_Date, Email, R_id from member where ID = #{ID}")
	MemberBean getModifyMemberInfo(int ID);
	
//	@Update("update member set Password = #{Password}, Phone_num = #{Phone_num}, Emergency_Contact = #{Emergency_Contact}, Address = #{Address}, Email = #{Email}, member_file = #{member_file, jdbcType=VARCHAR} where ID = #{ID}")
	@Update("update member set Password = #{Password}, Phone_num = #{Phone_num}, Emergency_Contact = #{Emergency_Contact}, Address = #{Address}, Email = #{Email} where ID = #{ID}")
	void modifyMemberInfo(MemberBean modifyMemberBean);

	//시간표
	@Select("select Name, ID, D_Name "
	         + "from member inner join student on id=std_id inner join department on department_id=d_id "
	         + "where ID=#{ID}")
	   MemberBean getTimeTableinfo(int ID);
	   
	   @Select("select lec_id, lec_name, completion, credits, dayOfTheWeek, StartTime, EndTime, R_ID from lecture "
	         + "where exists ( "
	         + "  select 1 from std_history where std_ID = #{ID} and (lec_id1 = lec_id or lec_id2 = lec_id or lec_id3 = lec_id or lec_id4 = lec_id or lec_id6 = lec_id) "
	         + ") and YearOfOpening = 2022 and semester = 2")
	   List<LectureBean> timeTableUserInfo(int ID);
	
}
