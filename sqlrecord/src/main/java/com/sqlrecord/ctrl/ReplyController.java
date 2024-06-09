package com.sqlrecord.ctrl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sqlrecord.dto.Reply;
import com.sqlrecord.service.MemberService;
import com.sqlrecord.service.ReplyService;

@Controller
@RequestMapping("/reply/")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("list.do")
	public String getReplyList(Model model) {
		model.addAttribute("list", replyService.getReplyList());
		return "reply/list";
	}
	
	@RequestMapping("detail.do")
	public String getReply(@RequestParam("rno") int rno, Model model) {
		Reply reply = replyService.getReply(rno);
        model.addAttribute("reply", reply);
		return "reply/detail";
	}
	
	@GetMapping("count.do")
    public String getReplyCount(Model model) {
        int replyCount = replyService.replyCount();
        model.addAttribute("replyCount", replyCount);
        return "reply/list"; 
    }
	
    @PostMapping("insReply.do")
    public String insReply(@ModelAttribute Reply reply) {
    	String id = (String) session.getAttribute("sid");
    	reply.setId(id);
        replyService.insReply(reply);
        return "redirect:/reply/list"; 
    }
    //Reply 클래스의 필드명과 폼의 입력 필드명(name 속성)이 일치해야함
    
    @GetMapping("delReply.do")
	public String delReply(@RequestParam("rno") int rno, Model model) {
    	replyService.delReply(rno);
		return "redirect:list.do";
	}
    
    @RequestMapping("getReplyStarAll.do")
    public String getReplyStarAll(Model model) {
        List<Map<String, Object>> starAll = replyService.getReplyStarAll();
        model.addAttribute("starAll", starAll);
        
        int replyCount = replyService.replyCount();
        model.addAttribute("replyCount", replyCount);

        float avgStar = replyService.avgStar();
        model.addAttribute("avgStar", avgStar);
        
        return "reply/list"; // 별점 분포를 표시할 JSP 페이지
    }
}
