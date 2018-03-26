package com.template.test;

import com.avatar.db.annotation.Column;
import com.avatar.db.annotation.GeneratorType;
import com.avatar.db.annotation.Table;
import com.common.BaseDAO;

@Table(name="test")
public class Test {
	
	@Column(name="id",primaryKey=true,generatorType=GeneratorType.AUTO_INCREMENT)
	private Long id;
	
	@Column(name="name")
	private String name;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public static void main(String[] args){
		BaseDAO dao=new BaseDAO();
		Test t=new Test();
		t.setName("I Come.!");
		dao.insert(t);
//		Test test=(Test)dao.select(Test.class, 1);
		System.out.println(t.getId());
	}

}

