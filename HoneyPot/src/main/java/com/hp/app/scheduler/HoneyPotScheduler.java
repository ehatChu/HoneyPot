package com.hp.app.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hp.app.sanction.service.SanctionService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class HoneyPotScheduler {

	private final SanctionService service;
	@Scheduled(cron = "* */10 * * * *")
	public void start() {
		
//		System.out.println("정지 해제");
		int result = service.releaseMember();
		
//		System.out.println("정지 해제 인원수 : " + result);
		
		
	}
}
