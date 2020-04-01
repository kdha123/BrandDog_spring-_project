package com.branddog.member.mapper;

import java.util.List;

import com.branddog.member.dto.MemberDTO;

public interface MemberMapper {

	public List<MemberDTO> list();
	
	public MemberDTO login(MemberDTO dto);
	
	public Integer join(MemberDTO dto);
	
	public MemberDTO view(int no);
	
	public Integer update(MemberDTO dto);
	
	public Integer delete(MemberDTO dto);
}
