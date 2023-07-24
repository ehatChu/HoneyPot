package com.hp.app.friend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FriendController {

	@GetMapping("/member/friends")
	public String friend() {
		return "member/friend";
	}
	
}
