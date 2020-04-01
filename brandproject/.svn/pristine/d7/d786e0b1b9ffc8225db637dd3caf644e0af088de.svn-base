package com.branddog.member.sevice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.branddog.member.dto.MemberDTO;
import com.branddog.member.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.login(dto);
	}

	@Override
	public Integer join(MemberDTO dto) {
		// TODO Auto-generated method stub
		
		return mapper.join(dto);
	}

	@Override
	public MemberDTO view(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer update(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delete(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

}
