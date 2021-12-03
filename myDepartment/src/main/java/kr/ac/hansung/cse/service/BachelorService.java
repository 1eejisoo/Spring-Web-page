package kr.ac.hansung.cse.service;

import java.util.List;

import javax.validation.ValidationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.cse.dao.BachelorDao;
import kr.ac.hansung.cse.model.Bachelor;
@Service
public class BachelorService {
	
	@Autowired
	private BachelorDao bachelorDao;	// Dao에게 의존성 주입 (Service -> Dao)
	
	// 수강신청
	public void insert(Bachelor bachelor) {
		// TODO Auto-generated method stub
		bachelorDao.insert(bachelor);
	}
	// 수강신청시 중복된 과목이 있는지 체크하기 위함
	public int isDuplicateTitle(Bachelor bachelor) {
		return bachelorDao.hasTitle(bachelor);
	}
	// 수강신청내역 조회 
	public List<Bachelor> getCourseRegistration(){
		return bachelorDao.getCourseRegistration();
	}
	
	// 상세보기를 누르기 전 
	public List<Bachelor> getSimpleBachelor(){
		return bachelorDao.getSimpleBachelor();
	}
	
	// 취득학점 총계 
	public int getCreditAllSum() {
		return bachelorDao.getCreditAllSum();
	}

	
	// 상세 학사정보 조회 
	public List<Bachelor> getDetailsBachelor(String year, String semester){
		return bachelorDao.getDetailsBachelor(year, semester);
	}


}
