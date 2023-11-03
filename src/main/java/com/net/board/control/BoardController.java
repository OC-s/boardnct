package com.net.board.control;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.compiler.ast.Keyword;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.net.board.dto.BoardDTO;
import com.net.board.dto.MemberDTO;
import com.net.board.service.BoardService;
import com.net.board.service.MemberService;
import com.net.board.utill.PageUtil;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	BoardService bService;
	
	
	@GetMapping("/")
	public String index(Model model,Authentication authentication) {
//		MemberDTO dto = service.getIdOne(authentication.getName()); // 세션아이디로 가져오기
		return "redirect:list";
	}
	
	@GetMapping("list")
	public String list(Model model, @RequestParam(name = "cp", defaultValue = "1")int currentPage) {
		
		// 총페이지수
		int totalNumber = bService.getTotal();
		//페이지당 게시물수
		int recordPerPage = 10;
		
		// 총페이지수,한페이지당수, 현재페이지
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);
		
		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");
		
		List<BoardDTO> list = bService.getAll(startNo, endNo, null, null);
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		
		log.info("map : " + map);
		log.info("list : " + list);
		
		return "board/list";
	}
	
	@GetMapping("/search")
	public String search(Model model,
			@RequestParam("keyword")String keyword,
			@RequestParam("type")String type,
			@RequestParam(name = "cp", defaultValue = "1")int currentPage) {
		
		BoardDTO dto = new BoardDTO();
		dto.setKeyword(keyword);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("type", type);
		
//		log.info("type : " + type);
//		log.info("keyword : " + keyword);
		
		// 총페이지수
		int totalNumber = bService.getTotal(keyword);
		//페이지당 게시물수
		int recordPerPage = 10;
		
		// 총페이지수,한페이지당수, 현재페이지
		Map<String, Object> map = PageUtil.getPageData(totalNumber, recordPerPage, currentPage);
		
		int startNo = (int)map.get("startNo");
		int endNo = (int)map.get("endNo");
		
		List<BoardDTO> list = bService.getAll(startNo, endNo, keyword, type);
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		
//		log.info("map : " + map);
//		log.info("list : " + list);
		
		return "board/list";
	}

	
	@GetMapping("modify")
	public String modify(@RequestParam("bno")int bno, Model model) {
		
		BoardDTO dtoModify = bService.getOne(bno);
		model.addAttribute("dtoModify", dtoModify);
		
		log.info("modify : " + dtoModify);
		
		return "board/modify";
	}
	
	@PostMapping("modify")
	public String modifyOk(@ModelAttribute("BoardDTO")BoardDTO bdto) {
		bService.updateOne(bdto);
		
		return "redirect:list";
	}
	

	// 작성	
	@GetMapping("write")
	public String writeForm(Model model,Authentication authentication) {
		
		MemberDTO mdto = service.getIdOne(authentication.getName()); // 세션아이디로 가져오기
		model.addAttribute("mdto", mdto);
		
		log.info("dto" + mdto);
		
		return "board/write";
	}
	
	@PostMapping("write")
	public String writeOk(@ModelAttribute("bdto")BoardDTO dtoWrite) {
		bService.insertOne(dtoWrite);
		
		return "redirect:list";
	}
	
	
	@GetMapping("detail")
	public String detail(Model model, @RequestParam("bno")int bno) {
		
		BoardDTO detaildto = bService.getOne(bno);
		model.addAttribute("detaildto",detaildto);
		
		log.info("상세 : " + detaildto);
		
		
		return "board/detail";
	}
	
	@GetMapping("delete")
	public String deleteOk(@RequestParam("bno")int bno) {
		bService.deleteOne(bno);
		return "redirect:list";
	}
	
	
	
	
	
	
}
