package websocket.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@RequestMapping("/")
	public String chat(){
		return null;
	}
}
