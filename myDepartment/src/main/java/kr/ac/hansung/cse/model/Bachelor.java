package kr.ac.hansung.cse.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString 
public class Bachelor {

	@Pattern(regexp = "2022", message="2022년 과목만 수강 가능합니다.")	// 2022년 1학기에 신청할 과목이므로 2022만 올 수 있음 
	@NotEmpty(message="학년도란을 채워주세요.")
	private String year;
	
	@Pattern(regexp = "1", message="1학기 과목만 수강 가능합니다.")		// 2022년 1학기에 신청할 과목이므로 1만 올 수 있음 
	@NotEmpty(message="학기란을 채워주세요.")
	private String semester;
	
	private String course_id;
	
	@Size(min=2, max=100, message="교과목명을 2~100자 내로 적어주세요.")
	private String title;
 
	@NotEmpty(message="교과구분란을 채워주세요.")
	private String division;
	
	@Size(min=2, max=100, message="담당교수 이름을 2~100자 내로 적어주세요.")
	private String professor_name;
	
	@Range(min=1, max=3, message="학점란을 1~3 학점으로 채워주세요.")	
	private int credit;
	
}
