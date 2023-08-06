package com.hp.app.fee.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.hp.app.admin.vo.AdminVo;
import com.hp.app.fee.service.FeeService;
import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import retrofit2.http.GET;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FeeController {

	private final FeeService service;
	
	@GetMapping("fee/member")
    public String memberList(RedirectAttributes redirectAttributes,Model model,HttpSession session,@RequestParam Map<String, String> paramMap) throws Exception {
       
//            MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
//            String memberGrade = loginMember.getGrade();
//            if (memberGrade == null || !memberGrade.equals("Y")) {
//            	redirectAttributes.addFlashAttribute("alertMsg", "세대주만 조회가 가능합니다.");
//                return "redirect:/main/mmain";
//            }
            //log.info(memberGrade);
//			String no = loginMember.getNo();
		
			paramMap.put("no", "1");
		    //mfMap.put("paymentDate", paymentDate);
			log.info(paramMap.toString());
		    List<MemberFeeVo> mfvoList = service.memberFeeList(paramMap);
		    int mTotalFee = service.totalMemberFee(paramMap);

            model.addAttribute("mfvoList", mfvoList);
            model.addAttribute("memberTotal", mTotalFee);
            return "/mypage/myInfo/fee/list";
    }

	// 회원 관리비 바 차트 데이터
	@GetMapping(path = "fee/member/bar-chart", produces= "application/json")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getBarChart(MemberFeeVo vo) {
		
		String mno = "1";
		//AccountVo voCurrent = service.getBarChart(mno);
		
		// 현재 날짜
	    LocalDate currentDate = LocalDate.now();
	    // 1. 현재 달
	    String currentMonth = currentDate.minusMonths(1).format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    // 2. 현재 달 바로 이전 달
	    String previousMonth = currentDate.minusMonths(2).format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    // 3. 현재 달에서 1년을 뺀 달
	    String oneYearAgo = currentDate.minusYears(1).minusMonths(1).format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    
	    // 서비스 전달하고 int 값으로 받아와서 data set
	    Map<String , String> dateVo = new HashMap<String, String>();
		dateVo.put("currentMonth", currentMonth);
		dateVo.put("previousMonth", previousMonth);
		dateVo.put("oneYearAgo", oneYearAgo);
		dateVo.put("no", mno);

		int currentFee = service.currentFee(dateVo);
		int prevFee = service.prevFee(dateVo);
		int yearAgoFee = service.yearAgoFee(dateVo);
	    
		List<String> labels = new ArrayList<>();
	    List<Integer> data = new ArrayList<>();
	    data.add(prevFee);
	    data.add(currentFee);
	    data.add(yearAgoFee);

	    labels.add(previousMonth);
	    labels.add(currentMonth);
	    labels.add(oneYearAgo);
	    
	    Map<String, Object> chartData = new HashMap<>();
	    chartData.put("labels", labels);
	    chartData.put("data", data);
	    chartData.put("backgroundColor", Arrays.asList("#FF7EAD", "#C0FFFB", "#A1FFA5"));
  
	    return ResponseEntity.ok(chartData);
	} 
	
		// 회원 관리비 라인 차트 데이터
		@GetMapping(path = "fee/member/line-chart", produces= "application/json")
		@ResponseBody
		public ResponseEntity<Map<String,Object>> getLineChart(MemberFeeVo vo) {
			
			String mno = "1";
			//AccountVo voCurrent = service.getBarChart(mno);
			// 현재 날짜
		    LocalDate currentDate = LocalDate.now();
		    // 1. 현재 달
		    String currentYear = currentDate.format(DateTimeFormatter.ofPattern("YYYY"));
		    // 받아온 카테고리 이름 추가
		    String categoryName = vo.getCategoryName();
		    // 서비스 전달하고 int 값으로 받아와서 data set
		    Map<String , String> dateVo = new HashMap<String, String>();
			dateVo.put("currentYear", currentYear);
			dateVo.put("no", mno);
			dateVo.put("categoryName", categoryName);

			List<MemberFeeVo> cfList = service.oneYearFee(dateVo);
		    
			List<String> labels = new ArrayList<>();
			List<String> data = new ArrayList<>();
			for(MemberFeeVo cvo : cfList) {
				labels.add(cvo.getPaymentDate());
				data.add(cvo.getTotalPrice());
			}
			
			
			Map<String, Object> chartData = new HashMap<>();
			
			chartData.put("labels", labels);
			chartData.put("data", data);
			chartData.put("backgroundColor", Arrays.asList("#FF7EAD", "#C0FFFB", "#A1FFA5", "#E7FFB5", "#FFC397", "#47C4EC","#FB92E4","#5F9961"));
			
			return ResponseEntity.ok(chartData);
	  
		} 
	
	
	//회원 납부 조회
	// 회원 번호랑 월 데이터로 셀렉트(카테고리 이름, 가격)
	@GetMapping("fee/member/pay")
	public String payFee(Model model) throws Exception {
		String mno = "1";
		// 현재 날짜
	    LocalDate currentDate = LocalDate.now();

	    // 1. 현재 달
	    String currentMonth = currentDate.minusMonths(1).format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    // 2. 현재 달 바로 이전 달
	    String previousMonth = currentDate.minusMonths(2).format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    
	    // 서비스 전달하고 int 값으로 받아와서 data set
	    Map<String , String> dateVo = new HashMap<String, String>();
		dateVo.put("currentMonth", currentMonth);
		dateVo.put("previousMonth", previousMonth);
		dateVo.put("no", mno);
		
		// 서비스
		List<MemberFeeVo> mvoList = service.thisMonth(dateVo);
		log.info(mvoList.toString());
		
		// 총 금액
		int totalPrice = service.currentFee(dateVo);
		
		List<MemberFeeVo> currentMonthData = new ArrayList<>();
		List<MemberFeeVo> previousMonthData = new ArrayList<>();

		// 당월 , 전월에 해당하는 데이터를 분리하여 리스트에 추가
		for (MemberFeeVo memberFeeVo : mvoList) {
		    if (memberFeeVo.getPaymentDate().equals(currentMonth)) {
		        currentMonthData.add(memberFeeVo);
		    } else if (memberFeeVo.getPaymentDate().equals(previousMonth)) {
		        previousMonthData.add(memberFeeVo);
		    }
		}
		
	    model.addAttribute("currentMonthData", currentMonthData);
	    model.addAttribute("previousMonthData", previousMonthData);
	    model.addAttribute("mvoList", mvoList);
	    model.addAttribute("totalPrice", totalPrice);
	    
		return "/mypage/myInfo/fee/pay";
	}
	
		
	// 관리자 관리비 조회
	@GetMapping("fee/admin")
	public String AdminList(RedirectAttributes redirectAttributes,@RequestParam(name = "p", defaultValue = "1")  int p,Model model, HttpSession session,@RequestParam Map<String, String> paramMap) {
		
//		AdminVo loginMember = (AdminVo) session.getAttribute("loginMember");
//        String adminGrade = loginMember.getGrade();
//        if (adminGrade == null || !adminGrade.equals("M")) {
//        	redirectAttributes.addFlashAttribute("alertMsg", "관리소장만 접근이 가능합니다.");
//            return "redirect:/main/amain";
//        }
        
		int listCount = service.adminListCnt(paramMap);
		int CurrentPage = p;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, CurrentPage, pageLimit, boardLimit);
		
		// 관리비 조회
		List<AdminFeeVo> avoList = service.adminList(pv, paramMap);
		
		if(!avoList.isEmpty()) {
			model.addAttribute("pv", pv);
		}
		model.addAttribute("avoList", avoList);
		model.addAttribute("paramMap", paramMap);
		
		return "/admin/fee/list";
	}
	
	// 관리자 관리비 등록
	@PostMapping("fee/admin/add")
	public String addFee(AdminFeeVo vo, HttpSession session) {
//		AdminVo loginMember = (AdminVo)session.getAttribute("loginMember");
//		vo.setAdminNo(loginMember.getNo());
		vo.setAdminNo("1");
		int result = service.add(vo);
		log.info(vo.toString());
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/fee/admin?p=1";
	}
	
	// 관리자 관리비 수정
	@PostMapping(path="fee/admin/edit")
	@ResponseBody
	public String edit(AdminFeeVo vo) {
		int result = service.edit(vo);
		if(result != 1) {
			throw new RuntimeException();
		}
		return "success";
	}
	
	// 관리자 관리비 삭제
	@PostMapping("fee/admin/del")
	public String del(String no) {
		int result = service.delete(no);
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/fee/admin?p=1";
	}
	
	// 관리자 월 별 총괄 조회
	@GetMapping("fee/admin/getAllVoList")
	@ResponseBody
	public List<AdminFeeVo> getAllFee(@RequestParam String paymentDate) {

		Map<String, String> monthMap = new HashMap<>();
	    monthMap.put("paymentDate", paymentDate);

	    List<AdminFeeVo> fvoList = service.getAllFee(monthMap);

	    return fvoList;
	}
	
	// 엑셀 다운도르
	@RequestMapping("/fee/excelDown")
	public void excelDownload(HttpServletResponse response, String paymentDate) throws Exception{
		XSSFWorkbook wb=null;
		Sheet sheet=null;
		Row row=null;
		Cell cell=null; 
		wb = new XSSFWorkbook();
		sheet = wb.createSheet("TotalFeeList");
		
		Map<String, String> monthMap = new HashMap<>();
	    monthMap.put("paymentDate", paymentDate);
		List<AdminFeeVo> totalFeeList =service.getAllFee(monthMap);
		
		//첫 행 열 이름 표기 
		int cellCount=0;
		row = sheet.createRow(0); 
		cell=row.createCell(cellCount++);
		cell.setCellValue("항목");
		cell=row.createCell(cellCount++);
		cell.setCellValue("비고");
		cell=row.createCell(cellCount++);
		cell.setCellValue("당월 금액");
		cell=row.createCell(cellCount++);
		cell.setCellValue("처리일자");
		
	
		for(int i=0; i < totalFeeList.size() ; i++  ) {
			row=sheet.createRow(i+1);  // '열 이름 표기'로 0번째 행 만들었으니까 1번째행부터
			cellCount=0; //열 번호 초기화
			cell=row.createCell(cellCount++);
			cell.setCellValue(totalFeeList.get(i).getCategoryName());
			cell=row.createCell(cellCount++);
			cell.setCellValue(totalFeeList.get(i).getContent());
			cell=row.createCell(cellCount++);
			cell.setCellValue(totalFeeList.get(i).getPrice());
			cell=row.createCell(cellCount++);
			cell.setCellValue(totalFeeList.get(i).getPaymentDate());
			
		}

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=month_total_FeeList.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		wb.write(response.getOutputStream());
	}
	
	// 관리자 -> 회원 관리비 고지
	// 고지하기 제출 누르면 회원 관리비로 인서트.
	@PostMapping("fee/admin/toMember")
	public String feeToMember(
	    @RequestParam("dong") String dong,
	    @RequestParam("ho") String ho,
	    @RequestParam("categoryName") List<String> categoryNames,
	    @RequestParam("price") List<String> prices,
	    HttpSession session
	) {
	    
	    List<MemberFeeVo> memberFeeVos = new ArrayList<>();
	    for (int i = 0; i < categoryNames.size(); i++) {
	        MemberFeeVo feeVo = new MemberFeeVo();
	        feeVo.setDong(dong);
	        feeVo.setHo(ho);
	        feeVo.setCategoryName(categoryNames.get(i));
	        feeVo.setPrice(prices.get(i));
	        
	        String categoryNo = service.getCategoryNo(categoryNames.get(i));
	        if (categoryNo == null) {
	            log.error("CategoryNo not found for categoryName: " + categoryNames.get(i));
	            continue;
	        }

	        feeVo.setFeeCno(categoryNo);
	        memberFeeVos.add(feeVo);
	        log.info(feeVo.toString());
	    }
	    for (MemberFeeVo feeVo : memberFeeVos) {
	         Map<String, String> dongHo = new HashMap<String, String>();
	         dongHo.put("dongNum", feeVo.getDong());
	         dongHo.put("hoNum", feeVo.getHo());
	         String memberNo = service.getMemberNo(dongHo);
	         log.info(memberNo);
	         feeVo.setMemberNo(memberNo);
	         log.info(feeVo.toString());
	         int result = service.insertMemberFee(feeVo);
	         System.out.println(result);
	         if(result == 1) {
	        	 System.out.println("인서트 성공");
	         }
	    }
	    session.setAttribute("alertMsg", "고지 완료되었습니다.");
	    return "redirect:/fee/admin";
	}
	
	
	
}
