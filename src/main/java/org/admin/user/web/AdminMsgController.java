package org.admin.user.web;

import javax.inject.Inject;

import org.admin.user.model.AdminMsgVO;
import org.admin.user.model.MsgCriteria;
import org.admin.user.service.AdminMemberService;
import org.admin.user.service.AdminMsgService;
import org.common.model.PageMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin/message/*")
public class AdminMsgController {
	

	@Inject
	private AdminMsgService msgService;
	@Inject
	private AdminMemberService memberService;
		
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") MsgCriteria cri, Model model)throws Exception {
		model.addAttribute("list", msgService.listPage(cri));
		int totalCnt = msgService.listCountPage(cri);
		model.addAttribute("totalCnt", totalCnt);
		PageMaker pageMaker = new PageMaker(cri, totalCnt);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/readmsg", method = RequestMethod.GET)
	public void readmsg(Integer msgno, Model model)throws Exception {
		model.addAttribute("msg", msgService.read(msgno));
	}
	
	@RequestMapping(value = "/sendmsg", method = RequestMethod.GET)
	public void sendmsgGET(String userid, Model model)throws Exception {
		model.addAttribute("member", memberService.read(userid));
	}
	
	@RequestMapping(value = "/sendmsg", method = RequestMethod.POST)
	public String sendmsgPOST(AdminMsgVO msgvo, Model model)throws Exception {
		msgService.regist(msgvo);
		return "/admin/message/success";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletemsg(String checkedVal, Model model)throws Exception {
		String[] checks = checkedVal.split(",");
		for (String msgno : checks) {
			msgService.remove(Integer.parseInt(msgno));
		}
		return "/admin/message/success";
	}

}
