package com.kamranyaseen.account.api;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kamranyaseen.account.model.Account;

@RestController
public class AccountController {

	@RequestMapping("/")
	public Account findAccount() {
		return new Account(1, 1, "123456789", 1234);
	}
	
}
