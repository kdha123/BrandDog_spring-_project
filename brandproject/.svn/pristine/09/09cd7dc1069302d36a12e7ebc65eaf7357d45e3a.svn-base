package com.branddog.food.sevice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.branddog.food.mapper.FoodMapper;


@Service
public class FoodServiceImpl implements FoodService {

	@Inject
	private FoodMapper mapper;
	@Override
	public String list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object view() {
		// TODO Auto-generated method stub
		System.out.println("servic1");
		return  mapper.view();
	}

	@Override
	public Object view2() {
		System.out.println("service2");
		// TODO Auto-generated method stub
		return mapper.view2();
	}

	@Override
	public Object count(String title) {
		// TODO Auto-generated method stub
		return mapper.count(title);
	}

}
