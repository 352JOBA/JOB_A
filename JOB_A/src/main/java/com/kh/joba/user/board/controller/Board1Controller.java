package com.kh.joba.user.board.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.board.model.service.Board1Service;
import com.kh.joba.user.board.model.vo.Board1;
import com.kh.joba.user.board.model.vo.Comment1;
import com.kh.joba.user.common.util.UtilsBoard1;

@Controller
public class Board1Controller {
	
	@Autowired
	Board1Service bs;
	
	// *******************************************************************************************
	// 							Write Form Controller Area
	// *******************************************************************************************
	@RequestMapping("/noticeWrite.bo")
	public String noticeForm() {
		return "user/board/write/noticeWrite";
	}
	@RequestMapping("/commonWrite.bo")
	public String commonForm() {
		return "user/board/write/commonWrite";
	}
	@RequestMapping("/interviewWrite.bo")
	public String interviewForm() {
		return "user/board/review/interview/interviewInsertForm";
	}
	
	// *******************************************************************************************
	// 							Notice Controller Area
	// *******************************************************************************************
	
	@RequestMapping("/notice.bo")
	public String noticeList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectNoticeList(cPage, numPerPage);
		int totalContents = bs.selectNoticeTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "notice.bo");
		
		// 조회확인용
		System.out.println("list : " + list);
		
		model.addAttribute("noticeList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/notice/notice"; 
	}
	@RequestMapping("/searchNotice.bo")
	public String searchNotice(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchNoticeList(cPage, numPerPage, keyword);
		int totalContents = bs.searchNoticeTotalContents(keyword);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchNotice.bo?keyword="+keyword);
		
		// 조회확인용
		System.out.println("keyword : " + keyword);
		//System.out.println("totalContents : " + totalContents);
		//System.out.println("list : " + list);
	
		model.addAttribute("noticeList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		//model.addAttribute("keyword", keyword);
		
		return "user/board/notice/notice"; 
	}	
	@RequestMapping("/selectOneNotice.bo")
	public String selectOneNotice(@RequestParam int board_no, Model model) { 
		System.out.println("[selectOneNotice] board_no : " + board_no);
		Board1 notice = bs.selectOneNotice(board_no);
		//System.out.println("Notice : " + notice);
		model.addAttribute("notice", notice);

		return "user/board/notice/noticeView"; 
	}
	@RequestMapping("/updateViewNotice.bo")
	public String updateViewNotice(@RequestParam int board_no, Model model) {
		System.out.println("[updateNotice] board_no : " + board_no);
		Board1 notice = bs.updateViewNotice(board_no);
		model.addAttribute("notice", notice);
		
		return "user/board/notice/noticeUpdate";
	}
	@RequestMapping("/updateNotice.bo")
	public String updateNotice(Board1 notice, HttpServletRequest req, Model model) {
		
		int board_no = notice.getBoard_no();
		//System.out.println("[updateNotice] board_no : " + board_no);
		//System.out.println("[updateNotice] notice : " + notice);
		Board1 originalNotice = bs.updateViewNotice(board_no);
		originalNotice.setBoard_title(notice.getBoard_title());
		originalNotice.setBoard_content(notice.getBoard_content());
		
		//System.out.println("[updateNotice] changed Notice : " + originalNotice);
		int result = bs.updateNotice(notice);
		String loc = "/notice.bo";
		String msg = "";
		
		if (result > 0) {
			msg = "공지사항 수정 성공";
		} else {
			msg = "공지사항 수정 실패...";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "user/common/msg";
	}
	@RequestMapping("/deleteNotice.bo")
	public String deleteNotice(@RequestParam int board_no, Model model) {
		System.out.println("[deleteNotice] board_no : " + board_no);
		
		int result = bs.deleteNotice(board_no);
		
		String loc = "/notice.bo";
		String msg = "";
		
		if ( result > 0 ) {
			msg = "공지사항 삭제 완료";
		} else {
			msg = "공지사항 삭제 실패.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "user/common/msg";
	}
	@RequestMapping("/insertNotice.bo")
	public String insertNotice(Board1 notice, Model model) {
		System.out.println("[insertNotice] board_title : " + notice.getBoard_title());
		int result = bs.insertNotice(notice);
		
		return "redirect:notice.bo";
	}
	
	

	// *******************************************************************************************
	// 							Mentoring Controller Area
	// *******************************************************************************************
	@RequestMapping("/mentoList.bo")
	public String mentowList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectMentoList(cPage, numPerPage);
		int totalContents = bs.selectMentoTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "mentoList.bo");
		
		// 조회확인용
		//System.out.println("list : " + list);
		
		model.addAttribute("mentoList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/mento/mentoList"; 
	}
	
	
	
	// *******************************************************************************************
	// 							UntilTomorrow Controller Area
	// *******************************************************************************************
	
	
	
	
	// *******************************************************************************************
	// 							InterviewReview Controller Area
	// *******************************************************************************************
	@RequestMapping("/interviewList.bo")
	public String interviewList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectInterviewList(cPage, numPerPage);
		int totalContents = bs.selectInterviewTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "interviewList.bo");
		
		// 조회확인용
		//System.out.println("list : " + list);
		
		model.addAttribute("interviewList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/review/interview/interviewList"; 
	}
	
	@RequestMapping("/selectOneInterview.bo")
	public String selectOneInterview(@RequestParam int board_no, Model model) {
		//System.out.println("Interview select One controller : " + board_no);
		Board1 interview = bs.selectOneInterview(board_no);
		List<Comment1> commentList = bs.selectCommentList(board_no);
		
		model.addAttribute("interview", interview);
		model.addAttribute("commentList", commentList);
		
		return "user/board/review/interview/interviewView";
	}
	
	@RequestMapping("/interviewUpdateForm.bo")
	public String interviewUpdateForm (@RequestParam int board_no, Model model) {
		Board1 interview = bs.selectOneInterview(board_no);
		
		String oriTitle = interview.getBoard_title();
		int target = oriTitle.indexOf("[");
		String mainTitle = oriTitle.substring(oriTitle.indexOf("[")+1, oriTitle.indexOf("]")).trim();
		String subTitle = oriTitle.substring(oriTitle.indexOf("]")+1).trim();
		
		interview.setBoard_mainTitle(mainTitle);
		interview.setBoard_title(subTitle);
		
		//System.out.println("mainTitle :" + mainTitle.trim());
		//System.out.println("subTitle :" + subTitle.trim());
		
		
		model.addAttribute("interview", interview);		
		return "user/board/review/interview/interviewUpdateForm";
	}
	
	@RequestMapping("/interviewUpdate.bo")
	public String interviewUpdate(@RequestParam String board_mainTitle, Board1 interview, Model model) {
		
		interview.setBoard_title("[" + changeToUpper(board_mainTitle) + "] " + interview.getBoard_title());
		
		int result = bs.interviewUpdate(interview);
		String msg = "";
		String loc = "";
		
		if (result > 0) {
			loc = "/selectOneInterview.bo?board_no=" + interview.getBoard_no();
			msg = "게시글 수정 성공";
		} else {
			msg = "게시글 수정 실패";
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
	
		return "user/common/msg";
	}
	
	@RequestMapping("/interviewDelete.bo")
	public String interviewDelete(@RequestParam int board_no, Model model) {
		int result = bs.interviewDelete(board_no);
		return "redirect:interviewList.bo";
	}
	
	@RequestMapping("/interviewInsert.bo")
	public String interviewInsert(@RequestParam String board_mainTitle, Board1 interview, Model model) {
		interview.setBoard_title("[" + changeToUpper(board_mainTitle) + "] " + interview.getBoard_title());
		int result = bs.interviewInsert(interview);
		return "redirect:interviewList.bo";
	}
	
	@RequestMapping("/searchInterview.bo")
	public String searchInterview(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchInterviewList(cPage, numPerPage, changeToUpper(keyword));
		int totalContents = bs.searchInterviewTotalContents(changeToUpper(keyword));
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchInterview.bo?keyword="+changeToUpper(keyword));
	
		model.addAttribute("interviewList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/review/interview/interviewList"; 
	}	
	
	
	// *******************************************************************************************
	// 							AcceptanceReview Controller Area
	// *******************************************************************************************
	@RequestMapping("/acceptList.bo")
	public String acceptList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectAcceptList(cPage, numPerPage);
		int totalContents = bs.selectAcceptTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "acceptList.bo");
		
		// 조회확인용
		//System.out.println("list : " + list);
		
		model.addAttribute("acceptList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/review/acceptance/acceptList"; 
	}
	
	@RequestMapping("/selectOneAccept.bo")
	public String selectOneAccept(@RequestParam int board_no, Model model) {
		//System.out.println("Interview select One controller : " + board_no);
		Board1 accept = bs.selectOneAccept(board_no);
		List<Comment1> commentList = bs.selectCommentList(board_no);
		
		model.addAttribute("accept", accept);
		model.addAttribute("commentList", commentList);
		
		return "user/board/review/acceptance/acceptView";
	}
	
	@RequestMapping("/acceptUpdateForm.bo")
	public String AcceptUpdateForm (@RequestParam int board_no, Model model) {
		Board1 accept = bs.selectOneAccept(board_no);
		
		String oriTitle = accept.getBoard_title();
		int target = oriTitle.indexOf("[");
		String mainTitle = oriTitle.substring(oriTitle.indexOf("[")+1, oriTitle.indexOf("]")).trim();
		String subTitle = oriTitle.substring(oriTitle.indexOf("]")+1).trim();
		
		accept.setBoard_mainTitle(mainTitle);
		accept.setBoard_title(subTitle);
		
		//System.out.println("mainTitle :" + mainTitle.trim());
		//System.out.println("subTitle :" + subTitle.trim());
		
		
		model.addAttribute("accept", accept);		
		return "user/board/review/acceptance/acceptUpdateForm";
	}
	
	@RequestMapping("/acceptUpdate.bo")
	public String acceptUpdate(@RequestParam String board_mainTitle, Board1 accept, Model model) {
		
		accept.setBoard_title("[" + changeToUpper(board_mainTitle) + "] " + accept.getBoard_title());
		
		int result = bs.acceptUpdate(accept);
		String msg = "";
		String loc = "";
		
		if (result > 0) {
			loc = "/selectOneAccept.bo?board_no=" + accept.getBoard_no();
			msg = "게시글 수정 성공";
		} else {
			msg = "게시글 수정 실패";
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
	
		return "user/common/msg";
	}
	
	@RequestMapping("/acceptDelete.bo")
	public String acceptDelete(@RequestParam int board_no, Model model) {
		int result = bs.acceptDelete(board_no);
		return "redirect:acceptList.bo";
	}
	
	@RequestMapping("/acceptInsert.bo")
	public String acceptInsert(@RequestParam String board_mainTitle, Board1 accept, Model model) {
		accept.setBoard_title("[" + changeToUpper(board_mainTitle) + "] " + accept.getBoard_title());
		int result = bs.acceptInsert(accept);
		return "redirect:acceptList.bo";
	}
	
	@RequestMapping("/searchAccept.bo")
	public String searchAccept(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchInterviewList(cPage, numPerPage, changeToUpper(keyword));
		int totalContents = bs.searchAcceptTotalContents(changeToUpper(keyword));
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchInterview.bo?keyword="+changeToUpper(keyword));
	
		model.addAttribute("interviewList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/review/acceptance/acceptList"; 
	}	
	
	
	
	
	
// *******************************************************************************************
// 							Common Method Area
// *******************************************************************************************
		public String fileNameChanger(String oldFileName) {
			
			String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd = (int)(Math.random() * 1000);
			return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		}
		
		//대문자 변환
		public String changeToUpper(String keyword) {
			String originalWord = keyword;
			String changedWord = "";
			char temp;
			for (int i = 0; i < keyword.length(); i++) {
				temp = originalWord.charAt(i);
				if ((97 <= temp) && (temp <= 122)) {
					changedWord += originalWord.valueOf(temp).toUpperCase();
				} else {
					changedWord += (char)temp;
				}
			}
			return changedWord;
		}
	
}
