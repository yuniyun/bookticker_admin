package org.admin.user.service;

import java.util.List;

import javax.inject.Inject;

import org.admin.user.model.MemberCriteria;
import org.admin.user.model.MemberVO;
import org.admin.user.model.PageCriteria;
import org.common.model.MemberMapper;
import org.springframework.stereotype.Service;

@Service
public class AdminMemberServieImpl implements AdminMemberService {

	@Inject
	private MemberMapper mapper;
	
	@Override
	public void regist(MemberVO member) throws Exception {
		mapper.create(member);
	}

	@Override
	public MemberVO read(String userid) throws Exception {
		return mapper.read(userid);
	}

	@Override
	public void modify(MemberVO member) throws Exception {
		member.setLivestate("탈퇴");
		mapper.update(member);
	}

	@Override
	public void remove(String userid) throws Exception {
		mapper.delete(userid);
	}

	@Override
	public Integer totalCnt() throws Exception {
		return mapper.totalCnt();
	}

	@Override
	public List<MemberVO> listAll() throws Exception {
		return mapper.listAll();
	}

	@Override
	public List<MemberVO> listPage(PageCriteria page) throws Exception {
		return mapper.listPage(page);
	}

	@Override
	public Integer listCountPage(PageCriteria cri) throws Exception {
		return mapper.listCountPage(cri);
	}

	@Override
	public List<MemberVO> listSearch(MemberCriteria cri) throws Exception {
		return mapper.listSearch(cri);
	}

	@Override
	public Integer listSearchCount(MemberCriteria cri) throws Exception {
		return mapper.listSearchCount(cri);
	}

	@Override
	public Integer percentGender() throws Exception {
		MemberCriteria memberCri = new MemberCriteria();	
		memberCri.setCheckGender("여자");
		
		int female = mapper.listSearchCount(memberCri);
		int all = mapper.totalCnt();
		
		return (int)(((double)female/all)*100);
	}

	@Override
	public Integer percentGrade() throws Exception {
		MemberCriteria memberCri = new MemberCriteria();	
		memberCri.setCheckGrade("작가");
		
		int author = mapper.listSearchCount(memberCri);
		int all = mapper.totalCnt();
		
		return (int)(((double)author/all)*100);
	}

	@Override
	public List<Integer> ageFigure() throws Exception {
		/*
		List<MemberVO> members = listAll();
		Calendar today = new GregorianCalendar();
		today.setTime(new Date());
		
		List<Integer> ages = new ArrayList<Integer>(); //나이대
		for(int i=0; i<8; i++){
			ages.add(0);
		}
		int birthYear; //생년
		int age; //나이
		
		for (MemberVO memberVO : members) {
			birthYear = Integer.parseInt(memberVO.getBirth().substring(0, 4));
			System.out.println("birthYear:"+birthYear);
			System.out.println("today:"+today.get(Calendar.YEAR));
			age = today.get(Calendar.YEAR) - birthYear + 1;
			System.out.println("age"+age);
			switch(age/10){
			case 0: ages.set(0, ages.get(0)+1); break;
			case 1: ages.set(1, ages.get(1)+1); break;
			case 2: ages.set(2, ages.get(2)+1); break;
			case 3: ages.set(3, ages.get(3)+1); break;
			case 4: ages.set(4, ages.get(4)+1); break;
			case 5: ages.set(5, ages.get(5)+1); break;
			case 6: ages.set(6, ages.get(6)+1); break;
			default: 
				if(age/10 > 6)ages.set(7, ages.get(7)+1); break;
			}
		}
		System.out.println(ages);*/
		return null;
	}
}
