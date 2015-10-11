package org.admin.user.web;

import javax.inject.Inject;

import org.admin.user.model.MemberVO;
import org.admin.user.model.PageMaker;
import org.admin.user.model.MemberCriteria;
import org.admin.user.service.AdminMemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/admin/user/*")
public class AdminUserController {

	@Inject
	private AdminMemberService memberService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") MemberCriteria cri, Model model)
			throws Exception {
		// use SearchCriteria
		model.addAttribute("list", memberService.listSearch(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		// use SearchCriteria
		pageMaker.setTotalCount(memberService.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	/*@RequestMapping(value = "/list", method = RequestMethod.POST)
	public void liveStatePOST(MemberVO member,
			RedirectAttributes rttr) throws Exception {
		logger.info(member);
		if (member.getLivestate().equals("Å»Åð")) {
			logger.info(member.getUsername() + " is already quit");

		} else if(member.getLivestate().equals("»ç¿ëÁß")) {
			memberService.modify(member);
			logger.info(member.getUsername() + " is quit !");
		} else {
			member.setLivestate("»ç¿ëÁß");
			memberService.regist(member);
			logger.info(member.getUsername() + " is join our service !");
		} 

	}*/

	@RequestMapping(value = "/author_regist", method = RequestMethod.GET)
	public void authorRegistGET(MemberVO member, RedirectAttributes rttr)
			throws Exception {

	}

}
