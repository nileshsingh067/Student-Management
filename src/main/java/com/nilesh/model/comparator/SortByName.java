package com.nilesh.model.comparator;

import java.util.Comparator;

import com.nilesh.model.Student;

public class SortByName implements Comparator<Student>{

	public SortByName() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public int compare(Student arg0, Student arg1) {
		// TODO Auto-generated method stub
		return arg0.getName().compareTo(arg1.getName());
	}

}
