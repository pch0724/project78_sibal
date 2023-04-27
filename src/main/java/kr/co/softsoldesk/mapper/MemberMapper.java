package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.LectureBean;
import kr.co.softsoldesk.beans.MemberBean;

public interface MemberMapper {
	
	@Select("select name from member where ID = #{ID}")
	String checkMemberIdExist(String ID);
	
	@Select("select ID, Name, password, birth, phone, emergency, address, entrance, email, r_id, first_login, member_file from member where ID = #{ID} and password = #{password}")
	MemberBean getLoginMemberInfo(MemberBean tempLoginMemberBean);
	
	@Select("select first_login from member where ID = #{ID}")
	String checkFirstLoginMember(int ID);
	
	@Update("update member set password = #{password}, first_login = 'true' where ID = #{ID}")
	void modifyFirstLogin(MemberBean modifyLoginMemberBean);
	
	@Select("select ID, Name, password, birth, phone, emergency, address, entrance, email, r_id, member_file from member where ID = #{ID}")
	MemberBean getModifyMemberInfo(int ID);
	
	//@Update("update member set Password = #{Password}, Phone_num = #{Phone_num}, Emergency_Contact = #{Emergency_Contact}, Address = #{Address}, Email = #{Email} where ID = #{ID}")
	@Update("update member set password = #{password}, phone = #{phone}, emergency = #{emergency}, address = #{address}, email = #{email}, member_file = #{member_file, jdbcType=VARCHAR} where ID = #{ID}")
	void modifyMemberInfo(MemberBean modifyMemberBean);

	//시간표
	@Select("select name, ID, d_name "
	         + "from member inner join student on ID=std_ID inner join department on student.d_ID=department.d_ID "
	         + "where ID=#{ID}")
	MemberBean getTimeTableinfo(int ID);
	   
	@Select("select lec_ID, lec_name, completion, credits, day, starttime, endtime, c_ID from lecture "
	         + "where exists ( "
	         + "  select 1 from std_history where std_ID = #{ID} and (lec_id1 = lec_id or lec_id2 = lec_id or lec_id3 = lec_id or lec_id4 = lec_id or lec_id6 = lec_id) "
	         + ") and year = 2022 and semester = 2")
	List<LectureBean> timeTableUserInfo(int ID);
	
}
