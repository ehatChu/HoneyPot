package com.hp.app.friend.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class FriendController {

	@GetMapping("friends")
	public String friend() {
		return "member/friend";
	}
	
}
