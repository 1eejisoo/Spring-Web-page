package kr.ac.hansung.cse.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.cse.model.Bachelor;

@Repository("bachelorDao")
public class BachelorDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// 수강신청
	public boolean insert(Bachelor bachelor) {
		String year = bachelor.getYear();
		String semester = bachelor.getSemester();
		String title = bachelor.getTitle();
		String division = bachelor.getDivision();
		String professor_name = bachelor.getProfessor_name();
		int credit = bachelor.getCredit();

		String sqlStatement = "insert into register (year, semester, title, division, professor_name, credit) value (?,?,?,?,?,?)"; 
		return (jdbcTemplate.update(sqlStatement, new Object[]{ year, semester, title, division, professor_name, credit}) == 1);
	}

	// 수강신청시, 과목이 중복되는 것을 방지하기 위함(1이 리턴되면 안됨)
	public int hasTitle(Bachelor bachelor) {
		String title = bachelor.getTitle();
		String sqlStatement = "select count(*) from register where title=?";
		return jdbcTemplate.queryForObject(sqlStatement,new Object[] {title}, Integer.class);
	}
	
	// 수강신청내역 read 
	public List<Bachelor> getCourseRegistration() {
		String sqlStatement = "select * from register";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Bachelor>() {
			@Override
			public Bachelor mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Bachelor bachelor = new Bachelor();
				bachelor.setYear(rs.getString("year"));
				bachelor.setSemester(rs.getString("semester"));
				bachelor.setTitle(rs.getString("title"));
				bachelor.setDivision(rs.getString("division"));
				bachelor.setProfessor_name(rs.getString("professor_name"));
				bachelor.setCredit(rs.getInt("credit"));

				return bachelor;
			}
			
		});
	}	
	
	// 년도, 학기, 취득학점 read 
	public List<Bachelor> getSimpleBachelor() {
		String sqlStatement = "select year, semester, sum(credit)credit from bachelor  group by year,semester order by year";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Bachelor>() {
			@Override
			public Bachelor mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Bachelor bachelor = new Bachelor();
				bachelor.setYear(rs.getString("year"));
				bachelor.setSemester(rs.getString("semester"));
				bachelor.setCredit(rs.getInt("credit"));

				return bachelor;
			}
			
		});
	}	
	
	// 취득학점 총계 read 
	public int getCreditAllSum() {
		String sqlStatement = "select sum(credit) from bachelor";
		return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
	}
	
	// 상세 학사정보 read
	public List<Bachelor> getDetailsBachelor(String year, String semester) {
		String sqlStatement = "select * from bachelor where year=? and semester=?";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Bachelor>() {
			@Override
			public Bachelor mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Bachelor bachelor = new Bachelor();
				bachelor.setYear(rs.getString("year"));
				bachelor.setSemester(rs.getString("semester"));
				bachelor.setCourse_id(rs.getString("course_id"));
				bachelor.setTitle(rs.getString("title"));
				bachelor.setDivision(rs.getString("division"));
				bachelor.setProfessor_name(rs.getString("professor_name"));
				bachelor.setCredit(rs.getInt("credit"));

				return bachelor;
			}
		}, new Object[] {year, semester}); 
	}

}
