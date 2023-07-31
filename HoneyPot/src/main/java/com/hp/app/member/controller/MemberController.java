package com.hp.app.member.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.service.MailSendService;
import com.hp.app.member.service.MemberService;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.util.file.FileUploader;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	private final MemberService ms;
	private final MailSendService mss;

	// 겟 매핑
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/mlogin";
	}

	@GetMapping("mlogin")
	public String mlogin(HttpSession session) {
		return "member/mlogin";
	}

	@GetMapping("alogin")
	public String alogin(HttpSession session) {
		return "member/alogin";
	}

	@GetMapping("mjoin")
	public String mjoin() {
		return "member/mjoin";
	}

	@GetMapping("ajoin")
	public String ajoin() {
		return "member/ajoin";
	}

	@GetMapping("medit")
	public String medit(HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/main/mmain";
		}
		return "member/medit";
	}

	@GetMapping("aedit")
	public String aedit(HttpSession session) {
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			return "redirect:/main/amain";
		}
		return "member/aedit";
	}

	@GetMapping("findId")
	public String findId() {
		return "member/findId";
	}

	@GetMapping("findPwd")
	public String findPwd() {
		return "member/findPwd";
	}

	@GetMapping("changePwd")
	public String changePwd(HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		if (loginMember == null && loginAdmin == null) {
			return "redirect:/main/mmain";
		}
		return "member/changePwd";
	}

	@GetMapping("quit")
	public String quit(HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/main/mmain";
		}
		return "member/quit";
	}

	@GetMapping("midDubCheck")
	@ResponseBody
	public String midDubCheck(String id, HttpSession session) {
		int result = ms.midDubCheck(id);
		log.info("result : {}", result);
		if (result != 0) {
			return "error";
		}
		return "success";
	}

	@GetMapping("aidDubCheck")
	@ResponseBody
	public String aidDubCheck(String id, HttpSession session) {
		int result = ms.aidDubCheck(id);
		log.info("result : {}", result);
		if (result != 0) {
			return "error";
		}
		return "success";
	}

	// 포스트 매핑
	@PostMapping("mlogin")
	public String mlogin(MemberVo vo, HttpSession session) {
		MemberVo loginMember = ms.mlogin(vo);
		session.setAttribute("loginMember", loginMember);
		log.info("loginMember : {}", loginMember);
		if (loginMember == null) {
			session.setAttribute("alertMsg", "입력하신 정보와 일치하는 회원 계정이 없습니다");
			return "redirect:/member/mlogin";
		}
		session.removeAttribute("loginAdmin");
		return "redirect:/main/mmain";
	}

	@PostMapping("alogin")
	public String alogin(AdminVo vo, HttpSession session) {
		AdminVo loginAdmin = ms.alogin(vo);
		session.setAttribute("loginAdmin", loginAdmin);
		log.info("loginAdmin : {}", loginAdmin);
		if (loginAdmin == null) {
			session.setAttribute("alertMsg", "입력하신 정보와 일치하는 관리자 계정이 없습니다");
			return "redirect:/member/alogin";
		}
		session.removeAttribute("loginMember");
		return "redirect:/main/amain";
	}

	@PostMapping("mjoin")
	public String mjoin(MemberVo vo, HttpSession session, HttpServletRequest req,
			@RequestParam("file") MultipartFile file) throws Exception {
		String path = req.getServletContext().getRealPath("/resources/member/profile/");
		String fileName = "";
		if (!file.isEmpty()) {
			fileName = FileUploader.saveFile(path, file);
			String filePath = path + fileName;
			File destinationFile = new File(filePath);
			file.transferTo(destinationFile);
			vo.setProfile(fileName);
		}

		int result = ms.mjoin(vo);
		log.info("result : {}", result);
		if (result != 1) {
			(new File(fileName)).delete();
			session.setAttribute("alertMsg", "회원 가입에 실패하였습니다");
			return "redirect:/member/mjoin";
		}
		session.setAttribute("alertMsg", "회원 가입을 성공하였습니다");
		return "redirect:/member/mlogin";
	}

	@PostMapping("ajoin")
	public String ajoin(AdminVo vo, HttpSession session, HttpServletRequest req,
			@RequestParam("file") MultipartFile file) throws Exception {
		String path = req.getServletContext().getRealPath("/resources/member/profile/");
		String fileName = "";
		if (!file.isEmpty()) {
			fileName = FileUploader.saveFile(path, file);
			String filePath = path + fileName;
			File destinationFile = new File(filePath);
			file.transferTo(destinationFile);
			vo.setProfile(fileName);
		}

		int result = ms.ajoin(vo);
		log.info("result : {}", result);
		if (result != 1) {
			(new File(fileName)).delete();
			session.setAttribute("alertMsg", "관리자 가입에 실패하였습니다");
			return "redirect:/member/ajoin";
		}
		session.setAttribute("alertMsg", "관리자 가입을 성공하였습니다");
		return "redirect:/member/alogin";
	}

	@PostMapping("medit")
	public String medit(MemberVo vo, HttpSession session, HttpServletRequest req,
			@RequestParam("file") MultipartFile file) throws Exception {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		MemberVo loginTemp = loginMember;
		loginTemp.setId(vo.getId());
		loginTemp.setPwd(vo.getPwd());
		loginTemp.setPhone(vo.getPhone());
		loginTemp.setEmail(vo.getEmail());

		String path = req.getServletContext().getRealPath("/resources/member/profile/");
		String fileName = "";
		if (!file.isEmpty()) {
			fileName = FileUploader.saveFile(path, file);
			String filePath = path + fileName;
			File destinationFile = new File(filePath);
			file.transferTo(destinationFile);
			loginTemp.setProfile(fileName);
		}

		int result = ms.medit(loginMember);
		log.info("result : {}", result);
		if (result != 1) {
			(new File(fileName)).delete();
			session.setAttribute("alertMsg", "회원정보 수정에 실패하였습니다");
			return "redirect:/member/medit";
		}
		session.setAttribute("loginMember", loginTemp);
		session.setAttribute("alertMsg", "회원정보 수정에 성공하였습니다!");
		return "redirect:/main/mmain";
	}

	@PostMapping("aedit")
	public String aedit(AdminVo vo, HttpSession session, HttpServletRequest req,
			@RequestParam("file") MultipartFile file) throws Exception {
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		AdminVo loginTemp = loginAdmin;
		loginTemp.setPwd(vo.getPwd());

		String path = req.getServletContext().getRealPath("/resources/member/profile/");
		String fileName = "";
		if (!file.isEmpty()) {
			fileName = FileUploader.saveFile(path, file);
			String filePath = path + fileName;
			File destinationFile = new File(filePath);
			file.transferTo(destinationFile);
			loginTemp.setProfile(fileName);
		}

		int result = ms.aedit(loginTemp);
		log.info("result : {}", result);
		if (result != 1) {
			session.setAttribute("alertMsg", "관리자 정보 수정에 실패하였습니다");
			return "redirect:/member/aedit";
		}
		session.setAttribute("loginAdmin", loginTemp);
		session.setAttribute("alertMsg", "관리자 정보 수정에 성공하였습니다!");
		return "redirect:/main/amain";
	}

	@PostMapping("emailCheckId")
	public String emailCheck(String email, Model model, HttpSession session) {
		try {
			model.addAttribute("email", email);
			model.addAttribute("emailCheck", mss.joinEmail(email));
		} catch (Exception e) {
			session.setAttribute("alertMsg", "입력된 이메일로 가입된 계정이 없습니다");
			return "redirect:/member/findId";
		}
		return "member/emailCheckId";
	}

	@PostMapping("emailCheckPwd")
	public String emailCheck(String id, String email, Model model, HttpSession session) {
		try {
			model.addAttribute("id", id);
			model.addAttribute("email", email);
			model.addAttribute("emailCheck", mss.joinEmail(email));
		} catch (Exception e) {
			session.setAttribute("alertMsg", "입력된 아이디와 이메일로 가입된 계정이 없습니다");
			return "redirect:/member/findPwd";
		}

		return "member/emailCheckPwd";
	}

	@PostMapping("findId")
	public String findId(String email, Model model) {
		String id = ms.findId(email);
		model.addAttribute("id", id);
		return "member/emailResult";
	}

	@PostMapping("findPwd")
	public String findPwd(MemberVo vo, Model model) {
		String pwd = ms.findPwd(vo);
		model.addAttribute("pwd", pwd);
		return "member/emailResult";
	}

	@PostMapping("changePwd")
	public String changePwd2(HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		if (loginMember == null && loginAdmin == null) {
			return "redirect:/main/mmain";
		}
		if (loginMember == null) {
			return "redirect:/member/aedit";
		}
		return "redirect:/member/medit";
	}

	@PostMapping("quit")
	public String quit2(HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		int result = ms.quit(loginMember.getNo());
		log.info("result : {}", result);
		if (result != 1) {
			session.setAttribute("alertMsg", "계정 탈퇴가 실패하였습니다");
			return "redirect:/member/medit";
		}
		session.setAttribute("alertMsg", "계정 탈퇴가 완료되었습니다");
		return "redirect:/member/mlogin";
	}
}
