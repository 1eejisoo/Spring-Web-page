package kr.ac.hansung.cse.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.hansung.cse.model.Bachelor;
import kr.ac.hansung.cse.service.BachelorService;

@Controller
public class BachelorController {
	@Autowired
	private BachelorService bachelorService; 
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}

	@RequestMapping(value = "/bachelorAccess", method = RequestMethod.GET)
	public String showBachelorAccess() {
		return "bachelor-access";
	}

	// 학기 별 이수 학점 조회
	@RequestMapping(value = "/bachelorAccess/credit")
	public String showBachelor(Model model) {

		List<Bachelor> bachelorSimple = bachelorService.getSimpleBachelor();
		model.addAttribute("bachelorSimple", bachelorSimple);

		int creditSum = bachelorService.getCreditAllSum();
		model.addAttribute("creditSum", creditSum);

		return "view-credits";

	}

	// 상세 학사정보 조회
	@RequestMapping(value = "/bachelorAccess/credit/details")
	public String showDetailsBachelor(Model model, String year, String semester) {
		List<Bachelor> detailsBachelor = bachelorService.getDetailsBachelor(year, semester);
		model.addAttribute("detailsBachelor", detailsBachelor);
		return "details";
	}

	// 수강신청을 하는 페이지
	@RequestMapping(value = "/bachelorAccess/registration")
	public String courseRegistration(Model model) {
		model.addAttribute("bachelor", new Bachelor());
		return "course-registration";

	}

	// 수강신청 완료 시 나오는 페이지
	@RequestMapping(value = "/bachelorAccess/docreate")
	public String doCreate(Model model, @Valid Bachelor bachelor, BindingResult result) {
		// 입력한 데이터 검증 과정
		if (result.hasErrors()) {
			System.out.println("===Form data does not validated ===");
			List<ObjectError> errors = result.getAllErrors();
			for (ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "course-registration";
		}
		
		// 이미 수강신청한 과목인지 체크 
		int duplicateCheck = bachelorService.isDuplicateTitle(bachelor);
		if (duplicateCheck == 1) {
			model.addAttribute("duplicateCheck", duplicateCheck);
			return "course-registration";
		}
		duplicateCheck = 0;
		bachelorService.insert(bachelor);
		return "course-created";

	}

	// 수강신청한 내역을 보는 페이지
	@RequestMapping(value = "/bachelorAccess/viewRegistration")
	public String courseRegistrationDetails(Model model) {
		List<Bachelor> courseRegistration = bachelorService.getCourseRegistration();
		model.addAttribute("courseRegistration", courseRegistration);
		return "view-course-registration";
	}

}
