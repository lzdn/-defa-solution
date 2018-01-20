package com.defa.manage.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.defa.utils.common.RequestMessage;
import com.defa.utils.common.ResponseMessage;

@Controller
public class SocketController {

	@RequestMapping("chat")
	public String chat() {
		return "im/ws";
	}

	@MessageMapping("/welcome")
	@SendTo("/topic/getResponse")
	public ResponseMessage say(RequestMessage message) {
		System.out.println(message.getName());
		return new ResponseMessage("welcome," + message.getName() + " !");
	}
}
