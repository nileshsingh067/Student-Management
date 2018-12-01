package com.nilesh.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;

import com.nilesh.model.Student;
import com.nilesh.util.DBConnection;


public class StudentDAO {
	public static final int UPDATE_NAME=1;
	public static final int UPDATE_COURSE=2;
	public static final int UPDATE_IMAGE=3;
	private static DecimalFormat df2 = new DecimalFormat(".##");
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
			//s=validateData(s);
			Student stud=getStudentByRoll(s);
			if(stud.getStatus()==1) {//already registered student 
				s.setStatus(1);
				s.setStatusMsg("Sorry | Roll NO "+s.getRoll()+" Already Reggistered.");
			}else { //process registration
					con=DBconn.getDBConnection("root", "admin");
					if(con!=null) {
						Statement st=con.createStatement();
						String sql="insert into tb_Student(s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath) "
								+ "values('"+s.getName()+"','"+s.getRoll()+"',"+s.getP_marks()+""
								+ ","+s.getC_marks()+","+s.getM_marks()+",'"+s.getImgPath()+"');";
						result=st.executeUpdate(sql);
						if(result>0) {
							s.setStatus(1);
							s.setStatusMsg("Thanks | "+s.getName()+" | Data Saved Successfully.");
						}else {
							s.setStatus(result);
							s.setStatusMsg("Sorry | "+s.getName()+" | Unable To Save Data.");
						}
						if(st!=null)st.close();
					}else {
						result=-2;
						s.setStatus(-2);
						s.setStatusMsg("Sorry | "+s.getName()+" | Fail To Creating mysql Connection");
						System.out.println("Fail To Creating mysql Connection");

					}
				}//end Of duplicate checking
			
		}catch(Exception ex) {
			result=-1;
			s.setStatus(-1);
			s.setStatusMsg("Sorry | "+s.getName()+" |Exception occured While Creating mysql Connection "+ex);
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
	public Student updateStudents(Student s) {
		DBConnection DBconn=new DBConnection();
		Connection con=null;
		s.setStatus(0);
		s.setStatusMsg("Running...");
		int result=0;
		try {
			//s=validateData(s);
			Student stud=getStudentByRoll(s);
			if(stud.getStatus()==1) {//already registered student 
				con=DBconn.getDBConnection("root", "admin");
				if(con!=null) {
					Statement st=con.createStatement();
					String sql="update tb_Student set s_name='"+s.getName()+"', s_pmarks='"+s.getP_marks()+"', s_cmarks="
							+ "'"+s.getC_marks()+"', s_mmarks='"+s.getP_marks()+"' where s_roll="+s.getRoll()+";";
					System.out.println("SQL :: "+sql);
					result=st.executeUpdate(sql);
					if(result>0) {
						s.setStatus(1);
						s.setStatusMsg("Thanks | "+s.getName()+" | Data Update Successfully.");
					}else {
						s.setStatus(result);
						s.setStatusMsg("Sorry | "+s.getName()+" | Unable To Update Data.");
					}
					if(st!=null)st.close();
				}else {
					result=-2;
					s.setStatus(-2);
					s.setStatusMsg("Sorry | "+s.getName()+" | Fail To Creating mysql Connection");
					System.out.println("Fail To Creating mysql Connection");

				}
			}else { //process registration
				s.setStatus(-1);
				s.setStatusMsg("Sorry | Roll NO "+s.getRoll()+" Not Found.");
				}//end Of duplicate checking
			
		}catch(Exception ex) {
			result=-1;
			s.setStatus(-1);
			s.setStatusMsg("Sorry | "+s.getName()+" |Exception occured While Creating mysql Connection "+ex);
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
				String sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student;";
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()){
					s=new Student();
					s.setId(rs.getInt("s_id"));
					s.setName(rs.getString("s_name"));
					s.setRoll(rs.getLong("s_roll"));
					s.setP_marks(rs.getDouble("s_pmarks"));
					s.setC_marks(rs.getDouble("s_cmarks"));
					s.setM_marks(rs.getDouble("s_mmarks"));
					s.setImgPath(rs.getString("s_imgpath"));
					//Math.round(a * 100.0) / 100.0;
					s.setAvg_marks(Math.round(((s.getP_marks()+s.getC_marks()+s.getM_marks())/3)*100.0)/100.0);
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
	public List<Student> getStudentsBetween(long std1,long std2) {
		DBConnection DBconn=new DBConnection();
		Connection con=null;
		List<Student> stList=new ArrayList<>();
		Student s=null;
		int result=0;
		try {
			con=DBconn.getDBConnection("root", "admin");
			if(con!=null) {
				Statement st=con.createStatement();
				String sql="";
				if(std1<=0&&std2<=0) {
				sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student;";
				}else if(std1<=0) {
					sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student where s_roll<="+std2+";";
				}else if(std2<=0) {
					sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student where s_roll>="+std1+";";
				}else {
					sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student where s_roll BETWEEN "+std1+" AND "+std2+";";	
				}
				ResultSet rs=st.executeQuery(sql);
				System.out.println("Sql :: "+sql);
				while(rs.next()){
					s=new Student();
					s.setId(rs.getInt("s_id"));
					s.setName(rs.getString("s_name"));
					s.setRoll(rs.getLong("s_roll"));
					s.setP_marks(rs.getDouble("s_pmarks"));
					s.setC_marks(rs.getDouble("s_cmarks"));
					s.setM_marks(rs.getDouble("s_mmarks"));
					s.setImgPath(rs.getString("s_imgpath"));
					s.setAvg_marks(Math.round(((s.getP_marks()+s.getC_marks()+s.getM_marks())/3)*100.0)/100.0);
					if(s.getAvg_marks()>=90) {s.setGrade("A");}
					else if(s.getAvg_marks()>=80&&s.getAvg_marks()<90){s.setGrade("B");}
					else if(s.getAvg_marks()>=70&&s.getAvg_marks()<80){s.setGrade("C");}
					else {s.setGrade("D");}
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
	
	public List<Student> getStudentsBetweenMarks(double std1,double std2,String findby) {
		DBConnection DBconn=new DBConnection();
		Connection con=null;
		List<Student> stList=new ArrayList<>();
		Student s=null;
		int result=0;
		String marks_name="";
		if(findby.equalsIgnoreCase("Physics")) {
			marks_name="s_pmarks";
		}else if(findby.equalsIgnoreCase("Chemistry")) {
			marks_name="s_cmarks";
		}else if(findby.equalsIgnoreCase("Math")) {
			marks_name="s_mmarks";
		}
		try {
			con=DBconn.getDBConnection("root", "admin");
			if(con!=null) {
				Statement st=con.createStatement();
				String sql="";
				if(std1<=0.0&&std2<=0.0) {
				sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student;";
				}else if(std1<=0) {
					sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student where "+marks_name+"<="+std2+";";
				}else if(std2<=0) {
					sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student where "+marks_name+">="+std1+";";
				}else {
					sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student where "+marks_name+" BETWEEN "+std1+" AND "+std2+";";	
				}
				ResultSet rs=st.executeQuery(sql);
				System.out.println("Sql :: "+sql);
				while(rs.next()){
					s=new Student();
					s.setId(rs.getInt("s_id"));
					s.setName(rs.getString("s_name"));
					s.setRoll(rs.getLong("s_roll"));
					s.setP_marks(rs.getDouble("s_pmarks"));
					s.setC_marks(rs.getDouble("s_cmarks"));
					s.setM_marks(rs.getDouble("s_mmarks"));
					s.setImgPath(rs.getString("s_imgpath"));
					s.setAvg_marks(Math.round(((s.getP_marks()+s.getC_marks()+s.getM_marks())/3)*100.0)/100.0);
					if(s.getAvg_marks()>=90) {s.setGrade("A");}
					else if(s.getAvg_marks()>=80&&s.getAvg_marks()<90){s.setGrade("B");}
					else if(s.getAvg_marks()>=70&&s.getAvg_marks()<80){s.setGrade("C");}
					else {s.setGrade("D");}
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
				String sql="select s_id,s_name,s_roll,s_pmarks,s_cmarks,s_mmarks,s_imgpath from tb_Student where s_roll='"+stud.getRoll()+"';";
				ResultSet rs=st.executeQuery(sql);
				System.out.println("getStudentByRoll Sql :: "+sql);
				if(rs.next()){
					s.setId(rs.getInt("s_id"));
					s.setName(rs.getString("s_name"));
					s.setRoll(rs.getLong("s_roll"));
					s.setP_marks(rs.getDouble("s_pmarks"));
					s.setC_marks(rs.getDouble("s_cmarks"));
					s.setM_marks(rs.getDouble("s_mmarks"));
					s.setImgPath(rs.getString("s_imgpath"));
					s.setAvg_marks(Math.round(((s.getP_marks()+s.getC_marks()+s.getM_marks())/3)*100.0)/100.0);
					if(s.getAvg_marks()>=90) {s.setGrade("A");}
					else if(s.getAvg_marks()>=80&&s.getAvg_marks()<90){s.setGrade("B");}
					else if(s.getAvg_marks()>=70&&s.getAvg_marks()<80){s.setGrade("C");}
					else {s.setGrade("D");}
					s.setStatus(1);
					s.setStatusMsg("Data Found.");
				}else{
					s.setStatus(0);
					s.setStatusMsg("Not Found.");
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
				}/*else if(action==UPDATE_COURSE) {
					sql="update tb_Student set s_course='"+s.getCourse()+"' where s_roll='"+s.getRoll()+"';";
				}*/else if(action==UPDATE_IMAGE) {
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
	public Student validateData(Student s,InputStream uploadedInputStream,FormDataContentDisposition fileDetail) {
		s.setStatus(1);
		s.setStatusMsg("Validation Done");;
		if(s.getName()==null||s.getName().length()<=0) {
			s.setStatus(-100);
			s.setStatusMsg("Enter Correct Name !");
		}else if(s.getRoll()<=0){
			s.setStatus(-100);
			s.setStatusMsg("Incorrect Roll No !");
		}else if(s.getP_marks()<=0||s.getC_marks()<0||s.getM_marks()<0||s.getP_marks()>100||s.getC_marks()>100||s.getM_marks()>100) {
			s.setStatus(-100);
			s.setStatusMsg("Incorrect Marks !");
		}else if(fileDetail.getFileName()==null||fileDetail.getFileName().length()<=0) {
			s.setStatus(-100);
			s.setStatusMsg("Invalid Image File !");
		}/*else if(fileDetail.getFileName().split(regex)) {
			s.setStatus(-100);
			s.setStatusMsg("Invalid Image File !");
		}*/
		System.out.println("validateData :: Status :: "+s.getStatus()+" :: Status Message :: "+s.getStatusMsg());
		return s;
	}
	public Student validateData(Student s) {
		s.setStatus(1);
		s.setStatusMsg("Validation Done");;
		if(s.getName()==null||s.getName().length()<=0) {
			s.setStatus(-100);
			s.setStatusMsg("Enter Correct Name !");
		}else if(s.getRoll()<=0){
			s.setStatus(-100);
			s.setStatusMsg("Incorrect Roll No !");
		}else if(s.getP_marks()<=0||s.getC_marks()<0||s.getM_marks()<0||s.getP_marks()>100||s.getC_marks()>100||s.getM_marks()>100) {
			s.setStatus(-100);
			s.setStatusMsg("Incorrect Marks !");
		}
		System.out.println("validateData :: Status :: "+s.getStatus()+" :: Status Message :: "+s.getStatusMsg());
		return s;
	}
}
