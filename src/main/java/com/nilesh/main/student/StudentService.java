package com.nilesh.main.student;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.inject.Singleton;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import com.nilesh.DAO.StudentDAO;
import com.nilesh.model.Student;
import com.nilesh.model.comparator.SortByGrade;
import com.nilesh.model.comparator.SortByMarks;
import com.nilesh.model.comparator.SortByName;
import com.nilesh.model.comparator.SortByRoll;

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
	@GET @Path("/findMultiple")
	@Produces({"application/json", "application/xml"})
	public List<Student> FindMultipleStudents(@QueryParam("from_roll") @DefaultValue("-1") long from_roll,
			@QueryParam("to_roll") @DefaultValue("-1") long to_roll) {
		StudentDAO stDAO=new StudentDAO();
		return stDAO.getStudentsBetween(from_roll, to_roll);
		
	}
	@GET @Path("/findMultipleSorted")
	@Produces({"application/json", "application/xml"})
	public List<Student> FindMultipleStudentsSorted(@QueryParam("from_roll") @DefaultValue("-1") long from_roll,
			@QueryParam("to_roll") @DefaultValue("-1") long to_roll,
			@QueryParam("sortby") @DefaultValue("name") String sortby) {
		StudentDAO stDAO=new StudentDAO();
		List<Student> stList=stDAO.getStudentsBetween(from_roll, to_roll);
		System.out.println("Sorting Criteria :: "+sortby);
		if(sortby.equalsIgnoreCase("name")) {
			Collections.sort(stList, new SortByName()); 
		}
		else if(sortby.equalsIgnoreCase("grade")) {
			Collections.sort(stList, new SortByGrade());
		}
		else if(sortby.equalsIgnoreCase("marks")) {
			Collections.sort(stList, new SortByMarks());
		}else if(sortby.equalsIgnoreCase("roll")) {
			Collections.sort(stList, new SortByRoll());
		}
		
		return stList;
		
	}
	@GET @Path("/findMultipleByMarks")
	@Produces({"application/json", "application/xml"})
	public List<Student> FindMultipleStudentsByMarks(@QueryParam("from_marks") @DefaultValue("0.0") double from_roll,
			@QueryParam("to_marks") @DefaultValue("100.0") double to_roll,
			@QueryParam("find_by") @DefaultValue("Physics") String sortby) {
		StudentDAO stDAO=new StudentDAO();
		List<Student> stList=stDAO.getStudentsBetweenMarks(from_roll, to_roll,sortby);
	System.out.println("Sorting Criteria :: "+sortby);
	/*	if(sortby.equalsIgnoreCase("name")) {
			Collections.sort(stList, new SortByName()); 
		}
		else if(sortby.equalsIgnoreCase("grade")) {
			Collections.sort(stList, new SortByGrade());
		}
		else if(sortby.equalsIgnoreCase("marks")) {
			Collections.sort(stList, new SortByMarks());
		}else if(sortby.equalsIgnoreCase("roll")) {
			Collections.sort(stList, new SortByRoll());
		}
		*/
		return stList;
		
	}
	@GET @Path("/findByRoll")
	@Produces({"application/json", "application/xml"})
	public Student FindByRoll(@QueryParam("roll") long roll) {
		StudentDAO stDAO=new StudentDAO();
		Student st=new Student();
		st.setRoll(roll);
		return stDAO.getStudentByRoll(st);
		
	}
	@GET @Path("/add")
	@Produces({"application/json", "application/xml"})
	public Student addEmployee(
			@QueryParam("name") String name,
			@QueryParam("roll") long roll,
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
			@QueryParam("roll") long roll
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
			@QueryParam("roll") long roll
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
	public Student addNewStudents(
			@FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail,
			@FormDataParam("ip_name") @DefaultValue("") String name,
			@FormDataParam("ip_roll") @DefaultValue("-1") long roll,
			@FormDataParam("ip_pm") @DefaultValue("-1") double pm ,
			@FormDataParam("ip_cm") @DefaultValue("-1") double cm,
			@FormDataParam("ip_mm") @DefaultValue("-1") double mm,
			@FormDataParam("pass") @DefaultValue("na") String pass){
		
		
		
		Student st=new Student();
		st.setName(name);
		st.setRoll(roll);
		st.setP_marks(pm);
		st.setC_marks(cm);
		st.setM_marks(mm);
		st.setPassword(pass);
		StudentDAO stDAO=new StudentDAO();
		String uploadedFileLocation = "/home/nilesh/eclipse-workspace/student/src/main/webapp/img/" + fileDetail.getFileName();

		// save it
		

		String output = "File uploaded to : " + uploadedFileLocation+" name : "+name+" roll : "+roll;
		st.setImgPath("../img/"+fileDetail.getFileName());
		st=stDAO.validateData(st,uploadedInputStream,fileDetail);
		if(st.getStatus()==1) {
		st=stDAO.addStudents(st);
		if(st.getStatus()==1)writeToFile(uploadedInputStream, uploadedFileLocation);
		}
		return st;
		
	}
	
	/*@POST @Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces({"application/json", "application/xml"})
	public Student updateAll(
			Student st){
		
		
		/*
		Student st=new Student();
		st.setName(name);
		st.setRoll(roll);
		st.setP_marks(pm);
		st.setC_marks(cm);
		st.setM_marks(mm);*/
		//StudentDAO stDAO=new StudentDAO();
		//String uploadedFileLocation = "/home/nilesh/eclipse-workspace/student/src/main/webapp/img/" + fileDetail.getFileName();

		// save it
		
		//System.out.println("Recieved Data :: "+st.toString());
		//System.out.println(servletRequest.getQueryString());
		//String output = "File uploaded to : " + uploadedFileLocation+" name : "+name+" roll : "+roll;
		//st.setImgPath("../img/"+fileDetail.getFileName());
	/*	st=stDAO.validateData(st,null,null);
		if(st.getStatus()==1) {
		st=stDAO.addStudents(st);
		}
		return st;
		
	}*/
	@GET @Path("/update")
	@Produces({"application/json", "application/xml"})
	public Student updateEmployee(
			@QueryParam("name") String name,
			@QueryParam("roll") long roll,
			@QueryParam("p_marks") double pm,
			@QueryParam("c_marks") double cm,
			@QueryParam("m_marks") double mm){
		
		
		
		Student st=new Student();
		st.setName(name);
		st.setRoll(roll);
		st.setP_marks(pm);
		st.setC_marks(cm);
		st.setM_marks(mm);
		System.out.println("Recieved Data :: "+st.toString());
		StudentDAO stDAO=new StudentDAO();
		st=stDAO.validateData(st);
		if(st.getStatus()==1) {
			st=stDAO.updateStudents(st);
			}
		return st;
		
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
