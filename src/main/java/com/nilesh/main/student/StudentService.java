package com.nilesh.main.student;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.inject.Singleton;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import com.nilesh.DAO.StudentDAO;
import com.nilesh.model.Student;

@Path("/stud")
public class StudentService {
	@GET @Path("/")
	 @Produces(MediaType.TEXT_PLAIN)
	    public String getStatus() {
	        return "working...";
	    }
	//http://localhost:8080/restweb/webapi/emp/add?roll=?hfhhk
	@GET @Path("/list")
	@Produces({"application/json", "application/xml"})
	public List<Student> FindEmployee() {
		StudentDAO stDAO=new StudentDAO();
		return stDAO.getAllStudents();
		
	}
	@GET @Path("/findByRoll")
	@Produces({"application/json", "application/xml"})
	public Student FindByRoll(@QueryParam("roll") String roll) {
		StudentDAO stDAO=new StudentDAO();
		Student st=new Student();
		st.setRoll(roll);
		return stDAO.getStudentByRoll(st);
		
	}
	@GET @Path("/add")
	@Produces({"application/json", "application/xml"})
	public Student addEmployee(
			@QueryParam("name") String name,
			@QueryParam("roll") String roll,
			@QueryParam("dob") String dob,
			@QueryParam("pm") double pm,
			@QueryParam("cm") double cm,
			@QueryParam("mm") double mm,
			@QueryParam("course") String course){
		
		
		
		Student st=new Student();
		st.setName(name);
		st.setRoll(roll);
		st.setCourse(course);
		st.setP_marks(pm);
		st.setC_marks(cm);
		st.setM_marks(mm);
		st.setDOB(dob);
		StudentDAO stDAO=new StudentDAO();
		
		return stDAO.addStudents(st);
		
	}
	@GET @Path("/updateName")
	@Produces({"application/json", "application/xml"})
	public Student updateName(
			@QueryParam("name") String name,
			@QueryParam("roll") String roll
			){
		
		
		
		Student st=new Student();
		st.setName(name);
		st.setRoll(roll);
		
		StudentDAO stDAO=new StudentDAO();
		
		return stDAO.updateStudents(st, StudentDAO.UPDATE_NAME);
		
	}
	@GET @Path("/updateCourse")
	@Produces({"application/json", "application/xml"})
	public Student updateCourse(
			@QueryParam("course") String course,
			@QueryParam("roll") String roll
			){
		
		
		
		Student st=new Student();
		st.setCourse(course);
		st.setRoll(roll);
		
		StudentDAO stDAO=new StudentDAO();
		System.out.println(st.toString());
		return stDAO.updateStudents(st, StudentDAO.UPDATE_COURSE);
		
	}
	@POST @Path("/addStudent")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces({"application/json", "application/xml"})
	public String addNewStudents(
			@FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail,
			@FormDataParam("ip_name") String name,
			@FormDataParam("ip_roll") String roll,
			@FormDataParam("dob") String dob,
			@FormDataParam("ip_pm") double pm,
			@FormDataParam("ip_cm") double cm,
			@FormDataParam("ip_mm") double mm,
			@FormDataParam("ip_course") String course){
		
		
		
		Student st=new Student();
		st.setName(name);
		st.setRoll(roll);
		st.setCourse(course);
		st.setP_marks(pm);
		st.setC_marks(cm);
		st.setM_marks(mm);
		st.setDOB(dob);
		StudentDAO stDAO=new StudentDAO();
		String uploadedFileLocation = "/home/nilesh/eclipse-workspace/student/src/main/webapp/img/" + fileDetail.getFileName();

		// save it
		writeToFile(uploadedInputStream, uploadedFileLocation);

		String output = "File uploaded to : " + uploadedFileLocation+" name : "+name+" roll : "+roll;
		st.setImgPath("../img/"+fileDetail.getFileName());
		st=stDAO.addStudents(st);
		return st.toString();
		
	}
	// save uploaded file to new location
		private void writeToFile(InputStream uploadedInputStream,
			String uploadedFileLocation) {

			try {
				OutputStream out = new FileOutputStream(new File(
						uploadedFileLocation));
				int read = 0;
				byte[] bytes = new byte[1024];

				out = new FileOutputStream(new File(uploadedFileLocation));
				while ((read = uploadedInputStream.read(bytes)) != -1) {
					out.write(bytes, 0, read);
				}
				out.flush();
				out.close();
			} catch (Exception e) {
				System.out.println("Exception "+e);
				//e.printStackTrace();
			}

		}
}
