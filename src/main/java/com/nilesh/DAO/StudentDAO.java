package com.nilesh.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nilesh.model.Student;
import com.nilesh.util.DBConnection;


public class StudentDAO {
	public static final int UPDATE_NAME=1;
	public static final int UPDATE_COURSE=2;
	public static final int UPDATE_IMAGE=3;
	public StudentDAO() {
		// TODO Auto-generated constructor stub
	}
	public Student addStudents(Student s) {
		DBConnection DBconn=new DBConnection();
		Connection con=null;
		s.setStatus(0);
		s.setStatusMsg("Running...");
		int result=0;
		try {
			con=DBconn.getDBConnection("root", "admin");
			if(con!=null) {
				Statement st=con.createStatement();
				String sql="insert into tb_Student(s_name,s_roll,s_course,s_pmarks,s_cmarks,s_mmarks,s_dob,s_imgpath) "
						+ "values('"+s.getName()+"','"+s.getRoll()+"','"+s.getCourse()+"',"+s.getP_marks()+""
								+ ","+s.getC_marks()+","+s.getM_marks()+",now(),'"+s.getImgPath()+"');";
				result=st.executeUpdate(sql);
				if(result>0) {
					s.setStatus(1);
					s.setStatusMsg(s.getName()+" | Data Saved Successfully.");
				}else {
					s.setStatus(result);
					s.setStatusMsg("");
				}
				if(st!=null)st.close();
			}else {
				result=-2;
				s.setStatus(-2);
				s.setStatusMsg(s.getName()+" |Fail To Creating mysql Connection");
				System.out.println("Fail To Creating mysql Connection");

			}
			
		}catch(Exception ex) {
			result=-1;
			s.setStatus(-1);
			s.setStatusMsg(s.getName()+" |Exception occured While Creating mysql Connection "+ex);
			System.out.println("Exception occured While Creating mysql Connection :: "+ex);


		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}


		}

		return s;	
	}
	public List<Student> getAllStudents() {
		DBConnection DBconn=new DBConnection();
		Connection con=null;
		List<Student> stList=new ArrayList<>();
		Student s=null;
		int result=0;
		try {
			con=DBconn.getDBConnection("root", "admin");
			if(con!=null) {
				Statement st=con.createStatement();
				String sql="select s_id,s_name,s_roll,s_course,s_pmarks,s_cmarks,s_mmarks,s_dob,s_imgpath from tb_Student;";
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()){
					s=new Student();
					s.setId(rs.getInt("s_id"));
					s.setName(rs.getString("s_name"));
					s.setRoll(rs.getString("s_roll"));
					s.setCourse(rs.getString("s_course"));
					s.setP_marks(rs.getDouble("s_pmarks"));
					s.setC_marks(rs.getDouble("s_cmarks"));
					s.setM_marks(rs.getDouble("s_mmarks"));
					s.setDOB(rs.getString("s_dob"));
					s.setImgPath(rs.getString("s_imgpath"));
					s.setAvg_marks((s.getP_marks()+s.getC_marks()+s.getM_marks())/3);
					stList.add(s);
					s=null;
					
				}
				if(rs!=null)rs=null;
				if(st!=null)st.close();

			}else {
				result=-2;
				System.out.println("Fail To Creating mysql Connection");

			}

		}catch(Exception ex) {
			result=-1;
			System.out.println("Exception occured While Creating mysql Connection :: "+ex);


		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}


		}

		return stList;	
	}
	public Student getStudentByRoll(Student stud) {
		DBConnection DBconn=new DBConnection();
		Connection con=null;
		Student s=new Student();
		s.setStatus(0);
		s.setStatusMsg("Running...");
		int result=0;
		try {
			con=DBconn.getDBConnection("root", "admin");
			if(con!=null) {
				Statement st=con.createStatement();
				String sql="select s_id,s_name,s_roll,s_course,s_pmarks,s_cmarks,s_mmarks,s_dob,s_imgpath from tb_Student where s_roll='"+stud.getRoll()+"';";
				ResultSet rs=st.executeQuery(sql);
				System.out.println("getStudentByRoll Sql :: "+sql);
				if(rs.next()){
					s.setId(rs.getInt("s_id"));
					s.setName(rs.getString("s_name"));
					s.setRoll(rs.getString("s_roll"));
					s.setCourse(rs.getString("s_course"));
					s.setP_marks(rs.getDouble("s_pmarks"));
					s.setC_marks(rs.getDouble("s_cmarks"));
					s.setM_marks(rs.getDouble("s_mmarks"));
					s.setDOB(rs.getString("s_dob"));
					s.setImgPath(rs.getString("s_imgpath"));
					s.setAvg_marks((s.getP_marks()+s.getC_marks()+s.getM_marks())/3);
					if(s.getAvg_marks()>=90) {s.setGrade("A");}
					else if(s.getAvg_marks()>=80&&s.getAvg_marks()<90){s.setGrade("B");}
					else if(s.getAvg_marks()>=70&&s.getAvg_marks()<80){s.setGrade("C");}
					else {s.setGrade("D");}
					s.setStatus(1);
					s.setStatusMsg("Done...");
				}else{
					s.setStatus(0);
					s.setStatusMsg("Not Found");
				}
				if(rs!=null)rs=null;
				if(st!=null)st.close();

			}else {
				result=-2;
				s.setStatus(-2);
				s.setStatusMsg("Fail To Creating mysql Connection");
				System.out.println("Fail To Creating mysql Connection");

			}

		}catch(Exception ex) {
			result=-1;
			s.setStatus(-1);
			s.setStatusMsg("Exception occured While Creating mysql Connection :: "+ex);
			System.out.println("Exception occured While Creating mysql Connection :: "+ex);


		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}


		}

		return s;	
	}
	
	public Student updateStudents(Student s,int action) {
		DBConnection DBconn=new DBConnection();
		Connection con=null;
		s.setStatus(0);
		s.setStatusMsg("Running...");
		int result=0;
		try {
			con=DBconn.getDBConnection("root", "admin");
			if(con!=null) {
				Statement st=con.createStatement();
				String sql="";
				if(action==UPDATE_NAME) {
					sql="update tb_Student set s_name='"+s.getName()+"' where s_roll='"+s.getRoll()+"';";
				}else if(action==UPDATE_COURSE) {
					sql="update tb_Student set s_course='"+s.getCourse()+"' where s_roll='"+s.getRoll()+"';";
				}else if(action==UPDATE_IMAGE) {
					sql="update tb_Student set s_imgpath='"+s.getImgPath()+"' where s_roll='"+s.getRoll()+"';";
				}
				result=st.executeUpdate(sql);
				if(result>0) {
					s.setStatus(1);
					s.setStatusMsg(s.getRoll()+" | Data Update Successfully.");
				}else {
					s.setStatus(-1);
					s.setStatusMsg(s.getRoll()+" | Unable To Update Data.");
				}
				if(st!=null)st.close();
				System.out.println("Sql  :: "+s.toString()+" Action "+action);
				System.out.println("updateStudents() :: "+sql+" | Result :: "+s.getStatusMsg());
			}else {
				//result=-2;
				s.setStatus(-2);
				s.setStatusMsg(s.getRoll()+" |Fail To Creating mysql Connection");
				System.out.println("Fail To Creating mysql Connection");

			}
			
		}catch(Exception ex) {
			//result=-1;
			s.setStatus(-1);
			s.setStatusMsg(s.getRoll()+" |Exception occured While Creating mysql Connection "+ex);
			System.out.println("Exception occured While Creating mysql Connection :: "+ex);


		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}


		}

		return s;	
	}
	
}
