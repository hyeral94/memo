package com.somsom.memo.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.memo.post.bo.PostBO;

@RequestMapping("/post")
@RestController
public class PostRestController { //API 화면

	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpServletRequest request) {
		
		//세션 가져오기
		HttpSession session = request.getSession();
		
		//현재 로그인된 user table id(pk)
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.addPost(userId, subject, content, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/delete")
	public Map<String, String> postDelete(@RequestParam("postId") int postId) {
		int count = postBO.deletePost(postId);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
}
