package com.nilesh.model.comparator;

import java.util.Comparator;

import com.nilesh.model.Student;

public class SortByMarks implements Comparator<Student> {

	public SortByMarks() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int compare(Student arg0, Student arg1) {
		// TODO Auto-generated method stub
		return (int)arg1.getAvg_marks()-(int)arg0.getAvg_marks();
	}

}
