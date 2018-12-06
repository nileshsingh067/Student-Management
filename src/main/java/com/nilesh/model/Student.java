package com.nilesh.model;

public class Student {
	private int id;
	private String Name;
	private long Roll;
	private String Course;
	private double p_marks;
	private double c_marks;
	private double m_marks;
	private String DOB;
	private double avg_marks;
	private double percentage;
	private int status;
	private String statusMsg;
	private String grade;
	private String imgPath;
	private String password;
	public Student() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public long getRoll() {
		return Roll;
	}
	public void setRoll(long roll) {
		Roll = roll;
	}
	public String getCourse() {
		return Course;
	}
	public void setCourse(String course) {
		Course = course;
	}
	public double getP_marks() {
		return p_marks;
	}
	public void setP_marks(double p_marks) {
		this.p_marks = p_marks;
	}
	public double getC_marks() {
		return c_marks;
	}
	public void setC_marks(double c_marks) {
		this.c_marks = c_marks;
	}
	public double getM_marks() {
		return m_marks;
	}
	public void setM_marks(double m_marks) {
		this.m_marks = m_marks;
	}
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public double getAvg_marks() {
		return avg_marks;
	}
	public void setAvg_marks(double avg_marks) {
		this.avg_marks = avg_marks;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getStatusMsg() {
		return statusMsg;
	}
	public void setStatusMsg(String statusMsg) {
		this.statusMsg = statusMsg;
	}
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", Name=" + Name + ", Roll=" + Roll + ", Course=" + Course + ", p_marks=" + p_marks
				+ ", c_marks=" + c_marks + ", m_marks=" + m_marks + ", DOB=" + DOB + ", avg_marks=" + avg_marks
				+ ", percentage=" + percentage + ", status=" + status + ", statusMsg=" + statusMsg + ", grade=" + grade
				+ ", imgPath=" + imgPath + "]";
	}
	
	
}
