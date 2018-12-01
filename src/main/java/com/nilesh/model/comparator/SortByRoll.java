package com.nilesh.model.comparator;

import java.util.Comparator;

import com.nilesh.model.Student;

public class SortByRoll implements Comparator<Student>{

	public SortByRoll() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int compare(Student arg0, Student arg1) {
		// TODO Auto-generated method stub
		return (int)arg0.getRoll()-(int)arg1.getRoll();
	}

}
