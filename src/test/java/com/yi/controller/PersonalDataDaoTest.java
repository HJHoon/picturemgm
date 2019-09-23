package com.yi.controller;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.PersonalData;
import com.yi.persistence.PersonalDataDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PersonalDataDaoTest {
	@Autowired
	PersonalDataDao dao;
	
	@Test
	public void testCreate() throws Exception{
		PersonalData p = new PersonalData();
		Date d = new Date();
		p.setId("user02");
		p.setRegdate(d);
		p.setFile("");
		dao.insertData(p);
	}
	
}
